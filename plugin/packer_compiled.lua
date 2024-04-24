-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/miniapple/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/miniapple/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/miniapple/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/miniapple/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/miniapple/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  everforest = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["lsp-zero.nvim"] = {
    config = { "\27LJ\2\2’\4\0\0\a\0\30\00076\0\0\0'\1\1\0B\0\2\0029\1\2\0'\2\3\0B\1\2\0016\1\0\0'\2\4\0B\1\2\0029\1\5\0014\2\0\0B\1\2\0016\1\0\0'\2\6\0B\1\2\0029\1\5\0015\2\b\0005\3\a\0=\3\t\0024\3\3\0009\4\n\0>\4\1\3=\3\v\2B\1\2\0016\1\0\0'\2\f\0B\1\2\0025\2\15\0009\3\r\0019\3\14\3=\3\16\0029\3\17\0009\3\18\0035\4\21\0009\5\19\0019\5\20\5\18\6\2\0B\5\2\2=\5\22\0049\5\19\0019\5\23\5\18\6\2\0B\5\2\2=\5\24\0049\5\19\0019\5\25\0055\6\26\0B\5\2\2=\5\27\0049\5\19\0019\5\28\5B\5\1\2=\5\29\4B\3\2\2K\0\1\0\14<C-Space>\rcomplete\n<C-y>\1\0\1\vselect\2\fconfirm\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\17cmp_mappings\rdefaults\14behaviour\1\0\0\vSelect\19SelectBehavior\bcmp\rhandlers\18default_setup\21ensure_installed\1\0\0\1\4\0\0\rtsserver\18rust_analyzer\relixirls\20mason-lspconfig\nsetup\nmason\14recommend\vpreset\rlsp-zero\frequire\0" },
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2i\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["obsidian.nvim"] = {
    config = { "\27LJ\2\2{\0\0\4\0\6\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0004\2\3\0005\3\3\0>\3\1\2=\2\5\1B\0\2\1K\0\1\0\15workspaces\1\0\0\1\0\2\tpath\20~/project/notes\tname\nnotes\nsetup\robsidian\frequire\0" },
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  tokyonight = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/tokyonight",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\2g\0\0\4\0\a\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\5\0005\2\3\0004\3\0\0=\3\4\2=\2\6\1B\0\2\1K\0\1\0\vwindow\1\0\0\foptions\1\0\1\nwidth\3Z\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/miniapple/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\2{\0\0\4\0\6\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0004\2\3\0005\3\3\0>\3\1\2=\2\5\1B\0\2\1K\0\1\0\15workspaces\1\0\0\1\0\2\tpath\20~/project/notes\tname\nnotes\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2i\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\2g\0\0\4\0\a\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\5\0005\2\3\0004\3\0\0=\3\4\2=\2\6\1B\0\2\1K\0\1\0\vwindow\1\0\0\foptions\1\0\1\nwidth\3Z\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: lsp-zero.nvim
time([[Config for lsp-zero.nvim]], true)
try_loadstring("\27LJ\2\2’\4\0\0\a\0\30\00076\0\0\0'\1\1\0B\0\2\0029\1\2\0'\2\3\0B\1\2\0016\1\0\0'\2\4\0B\1\2\0029\1\5\0014\2\0\0B\1\2\0016\1\0\0'\2\6\0B\1\2\0029\1\5\0015\2\b\0005\3\a\0=\3\t\0024\3\3\0009\4\n\0>\4\1\3=\3\v\2B\1\2\0016\1\0\0'\2\f\0B\1\2\0025\2\15\0009\3\r\0019\3\14\3=\3\16\0029\3\17\0009\3\18\0035\4\21\0009\5\19\0019\5\20\5\18\6\2\0B\5\2\2=\5\22\0049\5\19\0019\5\23\5\18\6\2\0B\5\2\2=\5\24\0049\5\19\0019\5\25\0055\6\26\0B\5\2\2=\5\27\0049\5\19\0019\5\28\5B\5\1\2=\5\29\4B\3\2\2K\0\1\0\14<C-Space>\rcomplete\n<C-y>\1\0\1\vselect\2\fconfirm\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\17cmp_mappings\rdefaults\14behaviour\1\0\0\vSelect\19SelectBehavior\bcmp\rhandlers\18default_setup\21ensure_installed\1\0\0\1\4\0\0\rtsserver\18rust_analyzer\relixirls\20mason-lspconfig\nsetup\nmason\14recommend\vpreset\rlsp-zero\frequire\0", "config", "lsp-zero.nvim")
time([[Config for lsp-zero.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
