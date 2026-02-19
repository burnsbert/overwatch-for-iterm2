# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Overwatch is a live terminal dashboard for iTerm2 tabs. It shows every tab's working directory and session name, highlights Claude Code sessions, and lets you navigate/close tabs. Single-file Python script, zero dependencies beyond Python 3.6+ stdlib.

## Running

```bash
./overwatch          # run directly (has shebang)
python3 overwatch    # or invoke with python
```

No build step, no tests, no package manager. The entire app is the single `overwatch` file.

## Architecture

The `overwatch` file is a self-contained curses TUI application (~290 lines):

- **AppleScript queries** (`APPLESCRIPT`, `CLOSE_TAB_APPLESCRIPT`, `GOTO_TAB_APPLESCRIPT`) — invoked via `osascript` to get tab metadata, close tabs, and switch tabs in iTerm2
- **`get_claude_ttys()`** — runs `ps -eo tty,comm` to find TTYs with a `claude` process, used to badge Claude Code tabs
- **`fetch_tabs()`** — executes the main AppleScript, parses TSV output into `(window, tab, path, name, tty)` tuples
- **`main(stdscr)`** — curses event loop with 200ms input timeout and 10-second auto-refresh (`REFRESH_INTERVAL`). Handles rendering (header, tab rows, legend, footer) and keyboard input (navigation, goto, close with confirmation, refresh, quit)

## Platform Constraints

- **macOS-only** — depends on AppleScript and iTerm2
- **No shell integration required** — queries iTerm2 directly via `osascript`
- TTY detection uses `/dev/` prefix matching against `ps` output
