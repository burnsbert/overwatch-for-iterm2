# Overwatch for iTerm2

A live terminal dashboard for your iTerm2 tabs. See every tab's working directory and session name at a glance, with special highlighting for [Claude Code](https://claude.ai/code) sessions.

![overwatch screenshot](screenshot.png)

## Features

- **Live tab list** — shows current directory and session name for every tab across all windows
- **Claude Code detection** — automatically identifies tabs running Claude Code and highlights them in magenta
- **Tab switching** — press Enter to jump to any tab
- **Tab closing** — press x then y to close a tab (with confirmation)
- **Auto-refresh** — updates every 10 seconds, or press r to refresh immediately
- **Zero dependencies** — just Python 3.6+ and macOS

## Install

```bash
# Clone
git clone https://github.com/ericburns/overwatch-for-iterm2.git

# Copy to your PATH
cp overwatch-for-iterm2/overwatch /usr/local/bin/
chmod +x /usr/local/bin/overwatch
```

Or just copy the single `overwatch` file anywhere on your `$PATH`.

## Usage

```
overwatch
```

### Keys

| Key | Action |
|-----|--------|
| `↑` `↓` | Navigate tabs |
| `Enter` or `g` | Switch to selected tab |
| `x` | Close selected tab (asks for confirmation) |
| `r` | Refresh tab list |
| `q` or `Esc` | Quit overwatch |

### Tab badges

| Badge | Meaning |
|-------|---------|
| `CC` | Tab is running Claude Code (magenta) |
| `>>` | Tab running overwatch itself (green) |

## How it works

Overwatch uses AppleScript to query iTerm2 for tab metadata (session name, working directory, TTY) and `ps` to detect which TTYs have a `claude` process. Everything runs through macOS built-ins — no iTerm2 plugins or shell integration required.

## Requirements

- macOS
- iTerm2
- Python 3.6+

## License

MIT
