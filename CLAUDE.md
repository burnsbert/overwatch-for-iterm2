# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Overwatch is a live terminal dashboard for iTerm2 tabs. It shows every tab's working directory and session name, highlights Claude Code and Codex sessions, and lets you navigate/close tabs. Single-file Python script, zero dependencies beyond Python 3.7+ stdlib.

## Running

```bash
./overwatch          # run directly (has shebang)
python3 overwatch    # or invoke with python
```

No build step, no tests, no package manager. The entire app is the single `overwatch` file.

## Architecture

The `overwatch` file is a self-contained curses TUI application:

- **AppleScript queries** (`APPLESCRIPT`, `CLOSE_TAB_APPLESCRIPT`, `GOTO_TAB_APPLESCRIPT`) — invoked via `osascript` to get tab metadata, close tabs, and switch tabs in iTerm2
- **`get_agent_ttys()`** — runs `ps -eo tty,comm,args` to find TTYs with Claude Code or Codex processes, used to badge agent tabs
- **`fetch_tabs()`** — executes the main AppleScript, parses TSV output into `(window, tab, path, name, tty)` tuples
- **Claude Code usage limits** — reads Claude Code OAuth credentials from macOS Keychain and displays available rolling-window limits plus percentage-only extra-usage monthly limits; monthly reset is local midnight on the first day of the next month
- **Codex usage limits** — reads the local Codex OAuth token from `~/.codex/auth.json` and fetches account usage every 5 minutes
- **Usage footer layout** — usage rows share fixed columns for label, percent, bar, and reset details; hide Claude Code monthly dollar cap values by default, with `$` toggling them for the current run
- **`main(stdscr)`** — curses event loop with 200ms input timeout and 10-second auto-refresh (`REFRESH_INTERVAL`). Handles rendering (header, tab rows, legend, footer) and keyboard input (navigation, goto, close with confirmation, refresh, quit)

## Platform Constraints

- **macOS-only** — depends on AppleScript and iTerm2
- **No shell integration required** — queries iTerm2 directly via `osascript`
- TTY detection uses `/dev/` prefix matching against `ps` output
