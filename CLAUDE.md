# CLAUDE.md

The user is a new to Neovim and LazyVim, and is looking for a comprehensive help and guidance regarding how to use it's various functions.

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Overview

This is a LazyVim-based Neovim configuration that uses Lazy.nvim as the plugin manager.

## Architecture

### Core Structure

- **init.lua**: Entry point that bootstraps the configuration by loading `config.lazy`
- **lua/config/**: Core configuration files
  - `lazy.lua`: Bootstraps lazy.nvim and LazyVim, configures plugin loading
  - `autocmds.lua`: Custom autocommands (currently empty, loaded automatically)
  - `keymaps.lua`: Custom keymaps (currently empty, loaded automatically)
  - `options.lua`: Custom Neovim options (loaded automatically)
- **lua/plugins/**: Custom plugin configurations that extend/override LazyVim defaults
  - Each `.lua` file is automatically loaded by lazy.nvim
  - Files return plugin specs that can add, disable, or modify plugins

### Plugin Management Pattern

Plugins are defined as Lua tables with these common patterns:

- Add new plugin: `{ "author/plugin-name" }`
- Override LazyVim plugin: `{ "plugin-name", opts = { ... } }`
- Disable plugin: `{ "plugin-name", enabled = false }`
- Lazy load with keys: `{ "plugin-name", keys = { ... } }`
- Lazy load with commands: `{ "plugin-name", cmd = { ... } }`

### LazyVim Extras

The `lazyvim.json` file defines which LazyVim extras are enabled, including:

- AI: Copilot, Tabnine
- Languages: Python, TypeScript, Docker, JSON, YAML, Markdown, Tailwind
- Editor enhancements: Yanky, DAP (debugging), dial, inc-rename
- Testing framework
- Git integration

## Commands

### Neovim Management

- **Open Neovim**: `nvim`
- **Check LazyVim health**: `:checkhealth` (inside Neovim)
- **Update plugins**: `:Lazy sync` (inside Neovim)
- **View plugin status**: `:Lazy` (inside Neovim)

### Code Formatting

- **Format Lua files**: Uses Stylua with 2-space indentation, 120 column width
- **Format current file**: `<leader>cf` (inside Neovim, if formatter is configured)

### Key Bindings

- **Leader key**: Space (LazyVim default)
- **Plugin management**: `<leader>l` opens Lazy.nvim interface
- **Diffview**: `<leader>gd` opens git diff view

### Development Workflow

1. Add custom plugins by creating new files in `lua/plugins/`
2. Override LazyVim defaults by specifying the plugin name with new options
3. The `example.lua` file shows common patterns but is disabled by default
4. Plugin changes take effect on next Neovim restart or `:Lazy reload`

## Custom Configurations

### DAP (Debug Adapter Protocol)

- Configured for Python debugging with remote attach capability
- Includes path mappings for specific projects (conversations-monitoring-system, avoncore)

### Diffview

- Git diff visualization plugin
- Accessible via `<leader>gd`

### Project Management

The project.nvim plugin automatically detects and manages projects. Projects are detected by:
- Git repositories (`.git` folder)
- Package files (package.json, go.mod, Cargo.toml)
- Build files (Makefile)

**Adding Projects:**
1. **Automatic**: Simply open a file in a project directory with `nvim path/to/project/file`
2. **Manual**: Open Neovim in the project root directory
3. **Force add**: While in a project directory, the plugin will auto-detect it

**Project Commands:**
- `<leader>fp` - Open project picker (shows recent projects)
- Projects are saved in `~/.local/share/nvim/project_nvim/project_history`

**Managing Project List:**
- Recently opened projects appear automatically
- To remove a project: Delete its entry from the history file
- To add all subdirectories as projects, open a file from each project once

**Multi-Repository Workflow:**
```bash
# Add all repos to project list by opening them once
cd ~/projects
for dir in */; do
  nvim "$dir" -c ":q"  # Opens and immediately quits to register project
done
```

## Best Practices and Guidelines

- **Configuration Changes**:
  - Don't do edits to any nvim config files until user explicitly confirmed that he wants to make these changes
  - When there is an option to make some changes or even necessity in such changes - explain this to user clearly with some context and justification and wait for confirmation

### Configuration Philosophy

- Don't add any unnecessary config, we want to keep out config lean and minimalistic and only override defaults where really necessary.