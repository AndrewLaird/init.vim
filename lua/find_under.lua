-- Define a Lua module to encapsulate related functions and variables
local MyPlugin = {}

-- Use consistent naming conventions
function MyPlugin.get_function_or_method_name(node)

    local ts_utils = require('nvim-treesitter.ts_utils')

    if node:type() ~= 'method_declaration' then
        return nil
    end

    local function find_name(child_node)
        if child_node:type() == 'name' then
            return ts_utils.get_node_text(child_node)[1]
        end

        for grandchild in child_node:iter_children() do
            local result = find_name(grandchild)
            if result then
                return result
            end
        end
    end

    return find_name(node)
end

function MyPlugin.get_definition_node_of_member_call_expression(node)
    if not node or node:type() ~= 'member_call_expression' then
        print('Node is not a member_call_expression')
        return nil
    end

    local ts_utils = require('nvim-treesitter.ts_utils')
    local parsers = require('nvim-treesitter.parsers')
    local start_row, start_col, _, _ = node:range()
    local bufnr = vim.api.nvim_get_current_buf()
    local params = {
        textDocument = vim.lsp.util.make_text_document_params(bufnr),
        position = { line = start_row, character = start_col }
    }

    local result = vim.lsp.buf_request_sync(bufnr, 'textDocument/definition', params)

    if not result or not result[1] or not result[1].result then
        print('No definition found')
        return nil
    end

    local target_uri = result[1].result[1].targetUri or result[1].result[1].uri
    local target_range = result[1].result[1].targetRange or result[1].result[1].range
    local target_bufnr = vim.uri_to_bufnr(target_uri)
    vim.api.nvim_buf_set_option(target_bufnr, 'buflisted', true)

    local target_parser = parsers.get_parser(target_bufnr, 'php')
    local target_tree = target_parser:parse()[1]
    local target_node = target_tree:root():named_descendant_for_range(target_range.start.line, target_range.start.character, target_range["end"].line, target_range["end"].character)

    return target_node
end

-- Break up long functions into smaller ones
local function find_parent_function_or_method(node)
    while node and not (node:type() == 'function_definition' or node:type() == 'method_declaration') do
        node = node:parent()
    end

    return node
end

local function collect_function_calls(node, pattern, matches, visited_nodes)
    local ts_utils = require('nvim-treesitter.ts_utils')
    local parsers = require('nvim-treesitter.parsers')
    if not node or visited_nodes[node:id()] then
        return
    end

    visited_nodes[node:id()] = true

    if node:type() == 'function_call' or node:type() == 'method_declaration' then
        local lines = ts_utils.get_node_text(node)
        local text = table.concat(lines, "\n")

        if string.match(text, pattern) then
            local name = MyPlugin.get_function_or_method_name(node)
            local target_node = nil
            table.insert(matches, {node = node, text = text, name = name, target_node = target_node})
        end
    end

    if node:type() == 'call' or node:type() == 'method_call' or node:type() == 'member_call_expression' then
        local parser = parsers.get_parser(bufnr, 'php')
        local target_node = MyPlugin.get_definition_node_of_member_call_expression(node, parser)
        collect_function_calls(target_node, pattern, matches, visited_nodes)
    end

    for child in node:iter_children() do
        collect_function_calls(child, pattern, matches, visited_nodes)
    end
end

function MyPlugin.search_pattern(pattern)
    local ts_utils = require('nvim-treesitter.ts_utils')
    local cursor_node = ts_utils.get_node_at_cursor()

    local parent_function = find_parent_function_or_method(cursor_node)

    if not parent_function then
        print('Not inside a function or method')
        return
    end

    local matches = {}
    local visited_nodes = {}

    collect_function_calls(parent_function, pattern, matches, visited_nodes)

    if #matches > 0 then
        local lines = {}
        for _, match in ipairs(matches) do
            local range = ts_utils.node_to_lsp_range(match.node)
            local line = range.start.line + 1
            local text_lines = vim.split(match.text, '\n')
            if #text_lines > 0 then
                table.insert(lines, string.format('[line %d]', line))
                for _, text_line in ipairs(text_lines) do
                    table.insert(lines, text_line)
                end
            end
        end

        local bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

        vim.api.nvim_command('belowright split')
        vim.api.nvim_win_set_buf(0, bufnr)
    else
        print('No matches found')
    end
end

-- Return the Lua module
return MyPlugin
