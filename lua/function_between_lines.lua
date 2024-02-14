local ts_utils = require'nvim-treesitter.ts_utils'

function _G.functions_between_lines(start_line, end_line)
    local bufnr = vim.api.nvim_get_current_buf()
    local parser = vim.treesitter.get_parser(bufnr)
    local tree = parser:parse()[1]
    local root = tree:root()

    local result = {}

    local function node_in_range(node)
        local start_row, _, end_row, _ = node:range()
        return start_row >= start_line - 1 and end_row <= end_line - 1
    end

    local function find_common_ancestor(node1, node2)
        local function get_ancestors(node)
            local ancestors = {}
            local parent = node:parent()
            while parent ~= nil do
                table.insert(ancestors, parent)
                parent = parent:parent()
            end
            return ancestors
        end

        local ancestors1 = get_ancestors(node1)
        local ancestors2 = get_ancestors(node2)

        for _, ancestor1 in ipairs(ancestors1) do
            for _, ancestor2 in ipairs(ancestors2) do
                if ancestor1 == ancestor2 then
                    return ancestor1
                end
            end
        end
    end

    local start_function, end_function

    local function traverse(node)
        if node_in_range(node) and ts_utils.is_function(node) then
            if not start_function then
                start_function = node
            else
                end_function = node
            end
        end
        for _, child in ipairs(node:children()) do
            traverse(child)
        end
    end

    traverse(root)

    if start_function and end_function then
        local common_ancestor = find_common_ancestor(start_function, end_function)

        local function collect_functions(node, target)
            if ts_utils.is_function(node) then
                table.insert(result, ts_utils.get_node_text(node, bufnr))
            end
            if node == target then
                return true
            end
            for _, child in ipairs(node:children()) do
                if collect_functions(child, target) then
                    return true
                end
            end
            return false
        end

        collect_functions(common_ancestor, start_function)
        collect_functions(common_ancestor, end_function)
    end

    return result
end
