local M = {}
local Path = require("plenary.path")
local config = require("coverage.config")
local signs = require("coverage.signs")
local util = require('coverage.util')
local xml2lua = require('xml2lua')
local handler = require('xmlhandler.tree')
local util = require("coverage.util")

M.load = function(callback)
    local php_config = config.opts.lang.php
    local p = Path:new(php_config.coverage_file)
    if not p:exists() then
        vim.notify("No coverage data file exists.", vim.log.levels.INFO)
        return 
    end
    local stdout = ''
    local stderr = ''
    local f = io.open(tostring(p), 'rb')
    local data = f:read("*a")
    if f then
        f:close()
    end
    local output = handler:new()
    local parser = xml2lua.parser(output)
    parser:parse(data)

    if callback == nil then
        vim.notify("Callback is nil", vim.log.levels.INFO)
    end
    if output == nil then
        vim.notify("Output is nil", vim.log.levels.INFO)
    end
    if root == nil then
        vim.notify("root is nil", vim.log.levels.INFO)
    end

    callback(output.root)
    util.safe_decode(output.root, callback)
    -- return callback(output.root)
end

M.sign_list = function(data)
  if not data.coverage or not data.coverage.project then
    return { }
  end
  local sign_list = { }
  for _, file in pairs(data.coverage.project.file) do
    local _continue_0 = false
    repeat
      local buffer = vim.fn.bufnr(file._attr.name, false)
      if buffer == -1 then
        _continue_0 = true
        break
      end
      for _, line in pairs(file.line) do
        if tonumber(line._attr.count) > 0 then
          table.insert(sign_list, signs.new_covered(buffer, line._attr.num))
        else
          table.insert(sign_list, signs.new_uncovered(buffer, line._attr.num))
        end
      end
      _continue_0 = true
    until true
    if not _continue_0 then
      break
    end
  end
  return sign_list
end

M.summary = function(data)
  if not data.coverage or not data.coverage.project then
    return { }
  end
  local files = { }
  local total_statements = 0
  local total_missing = 0
  local total_branches = 0
  local total_partial_branches = 0
  local total_coverage = 0
  local total_coveredelements = 0
  local total_elements = 0
  for _, file in pairs(data.coverage.project.file) do
    local _continue_0 = false
    repeat
      if not (tonumber(file.metrics._attr.elements) > 0) then
        _continue_0 = true
        break
      end
      local percent = tonumber(file.metrics._attr.coveredelements) / tonumber(file.metrics._attr.elements) * 100
      local output = {
        filename = file._attr.name,
        statements = tonumber(file.metrics._attr.statements),
        branches = tonumber(file.metrics._attr.methods),
        excluded = 0,
        missing = tonumber(file.metrics._attr.statements) - tonumber(file.metrics._attr.coveredstatements),
        partial = tonumber(file.metrics._attr.methods) - tonumber(file.metrics._attr.coveredmethods),
        coverage = percent
      }
      total_statements = total_statements + output.statements
      total_missing = total_missing + output.missing
      total_branches = total_branches + output.branches
      total_partial_branches = total_partial_branches + output.partial
      total_coveredelements = total_coveredelements + tonumber(file.metrics._attr.coveredelements)
      total_elements = total_elements + tonumber(file.metrics._attr.elements)
      table.insert(files, output)
      _continue_0 = true
    until true
    if not _continue_0 then
      break
    end
  end
  local percent = tonumber(total_coveredelements) / tonumber(total_elements) * 100
  return {
    files = files,
    totals = {
      statements = total_statements,
      missing = total_missing,
      excluded = total_excluded,
      branches = total_branches,
      partial = total_partial_branches,
      coverage = percent
    }
  }
end

return M

-- do
--   local _class_0
--   local _base_0 = {
--     load = function(callback)
--       local php_config = config.opts.lang.php
--       local p = Path:new(php_config.coverage_file)
--       if not p:exists() then
--         vim.notify("No coverage data file exists.", vim.log.levels.INFO)
--         return 
--       end
--       local stdout = ''
--       local stderr = ''
--       local f = io.open(tostring(p), 'rb')
--       local data = f:read("*a")
--       if f then
--         f:close()
--       end
--       local output = handler:new()
--       local parser = xml2lua.parser(output)
--       parser:parse(data)
--       return callback(output.root)
--     end,
--     sign_list = function(data)
--       if not data.coverage or not data.coverage.project then
--         return { }
--       end
--       local sign_list = { }
--       for _, file in pairs(data.coverage.project.file) do
--         local _continue_0 = false
--         repeat
--           local buffer = vim.fn.bufnr(file._attr.name, false)
--           if buffer == -1 then
--             _continue_0 = true
--             break
--           end
--           for _, line in pairs(file.line) do
--             if tonumber(line._attr.count) > 0 then
--               table.insert(sign_list, signs.new_covered(buffer, line._attr.num))
--             else
--               table.insert(sign_list, signs.new_uncovered(buffer, line._attr.num))
--             end
--           end
--           _continue_0 = true
--         until true
--         if not _continue_0 then
--           break
--         end
--       end
--       return sign_list
--     end,
--     summary = function(data)
--       if not data.coverage or not data.coverage.project then
--         return { }
--       end
--       local files = { }
--       local total_statements = 0
--       local total_missing = 0
--       local total_branches = 0
--       local total_partial_branches = 0
--       local total_coverage = 0
--       local total_coveredelements = 0
--       local total_elements = 0
--       for _, file in pairs(data.coverage.project.file) do
--         local _continue_0 = false
--         repeat
--           if not (tonumber(file.metrics._attr.elements) > 0) then
--             _continue_0 = true
--             break
--           end
--           local percent = tonumber(file.metrics._attr.coveredelements) / tonumber(file.metrics._attr.elements) * 100
--           local output = {
--             filename = file._attr.name,
--             statements = tonumber(file.metrics._attr.statements),
--             branches = tonumber(file.metrics._attr.methods),
--             excluded = 0,
--             missing = tonumber(file.metrics._attr.statements) - tonumber(file.metrics._attr.coveredstatements),
--             partial = tonumber(file.metrics._attr.methods) - tonumber(file.metrics._attr.coveredmethods),
--             coverage = percent
--           }
--           total_statements = total_statements + output.statements
--           total_missing = total_missing + output.missing
--           total_branches = total_branches + output.branches
--           total_partial_branches = total_partial_branches + output.partial
--           total_coveredelements = total_coveredelements + tonumber(file.metrics._attr.coveredelements)
--           total_elements = total_elements + tonumber(file.metrics._attr.elements)
--           table.insert(files, output)
--           _continue_0 = true
--         until true
--         if not _continue_0 then
--           break
--         end
--       end
--       local percent = tonumber(total_coveredelements) / tonumber(total_elements) * 100
--       return {
--         files = files,
--         totals = {
--           statements = total_statements,
--           missing = total_missing,
--           excluded = total_excluded,
--           branches = total_branches,
--           partial = total_partial_branches,
--           coverage = percent
--         }
--       }
--     end
--   }
--   _base_0.__index = _base_0
--   _class_0 = setmetatable({
--     __init = function() end,
--     __base = _base_0,
--     __name = "PHPCoverage"
--   }, {
--     __index = _base_0,
--     __call = function(cls, ...)
--       local _self_0 = setmetatable({}, _base_0)
--       cls.__init(_self_0, ...)
--       return _self_0
--     end
--   })
--   _base_0.__class = _class_0
--   PHPCoverage = _class_0
-- end
-- return PHPCoverage

-- local Path = require("plenary.path")
-- local config = require("coverage.config")
-- local signs = require("coverage.signs")
-- local util = require('coverage.util')
-- local xml2lua = require('xml2lua')
-- local handler = require('xmlhandler.tree')
-- local PHPCoverage
-- do
--   local _class_0
--   local _base_0 = {
--     load = function(callback)
--       local php_config = config.opts.lang.php
--       local p = Path:new(php_config.coverage_file)
--       if not p:exists() then
--         vim.notify("No coverage data file exists.", vim.log.levels.INFO)
--         return 
--       end
--       local stdout = ''
--       local stderr = ''
--       local f = io.open(tostring(p), 'rb')
--       local data = f:read("*a")
--       if f then
--         f:close()
--       end
--       local output = handler:new()
--       local parser = xml2lua.parser(output)
--       parser:parse(data)
--       return callback(output.root)
--     end,
--     sign_list = function(data)
--       if not data.coverage or not data.coverage.project then
--         return { }
--       end
--       local sign_list = { }
--       for _, file in pairs(data.coverage.project.file) do
--         local _continue_0 = false
--         repeat
--           local buffer = vim.fn.bufnr(file._attr.name, false)
--           if buffer == -1 then
--             _continue_0 = true
--             break
--           end
--           for _, line in pairs(file.line) do
--             if tonumber(line._attr.count) > 0 then
--               table.insert(sign_list, signs.new_covered(buffer, line._attr.num))
--             else
--               table.insert(sign_list, signs.new_uncovered(buffer, line._attr.num))
--             end
--           end
--           _continue_0 = true
--         until true
--         if not _continue_0 then
--           break
--         end
--       end
--       return sign_list
--     end,
--     summary = function(data)
--       if not data.coverage or not data.coverage.project then
--         return { }
--       end
--       local files = { }
--       local total_statements = 0
--       local total_missing = 0
--       local total_branches = 0
--       local total_partial_branches = 0
--       local total_coverage = 0
--       local total_coveredelements = 0
--       local total_elements = 0
--       for _, file in pairs(data.coverage.project.file) do
--         local _continue_0 = false
--         repeat
--           if not (tonumber(file.metrics._attr.elements) > 0) then
--             _continue_0 = true
--             break
--           end
--           local percent = tonumber(file.metrics._attr.coveredelements) / tonumber(file.metrics._attr.elements) * 100
--           local output = {
--             filename = file._attr.name,
--             statements = tonumber(file.metrics._attr.statements),
--             branches = tonumber(file.metrics._attr.methods),
--             excluded = 0,
--             missing = tonumber(file.metrics._attr.statements) - tonumber(file.metrics._attr.coveredstatements),
--             partial = tonumber(file.metrics._attr.methods) - tonumber(file.metrics._attr.coveredmethods),
--             coverage = percent
--           }
--           total_statements = total_statements + output.statements
--           total_missing = total_missing + output.missing
--           total_branches = total_branches + output.branches
--           total_partial_branches = total_partial_branches + output.partial
--           total_coveredelements = total_coveredelements + tonumber(file.metrics._attr.coveredelements)
--           total_elements = total_elements + tonumber(file.metrics._attr.elements)
--           table.insert(files, output)
--           _continue_0 = true
--         until true
--         if not _continue_0 then
--           break
--         end
--       end
--       local percent = tonumber(total_coveredelements) / tonumber(total_elements) * 100
--       return {
--         files = files,
--         totals = {
--           statements = total_statements,
--           missing = total_missing,
--           excluded = total_excluded,
--           branches = total_branches,
--           partial = total_partial_branches,
--           coverage = percent
--         }
--       }
--     end
--   }
--   _base_0.__index = _base_0
--   _class_0 = setmetatable({
--     __init = function() end,
--     __base = _base_0,
--     __name = "PHPCoverage"
--   }, {
--     __index = _base_0,
--     __call = function(cls, ...)
--       local _self_0 = setmetatable({}, _base_0)
--       cls.__init(_self_0, ...)
--       return _self_0
--     end
--   })
--   _base_0.__class = _class_0
--   PHPCoverage = _class_0
-- end
-- return PHPCoverage
