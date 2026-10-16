<img src="assets/icon.svg" width="64" height="64" alt="">

# zed-systemverilog

Minimal SystemVerilog (and Verilog) support for [Zed](https://zed.dev), built on
[tree-sitter-systemverilog](https://github.com/gmlarumbe/tree-sitter-systemverilog)
(IEEE 1800-2023).

Files: `.sv`, `.svh`, `.v`, `.vh`

## Features

- **Syntax highlighting**: keywords, built-in types, user types, modules and
  instances, functions and tasks, system tasks (`$display`), compiler
  directives and macros, numbers, strings, comments, attributes and block labels.
- **Bracket matching**: `()`, `[]`, `{}`, `'{}` plus keyword blocks
  (`begin`/`end`, `module`/`endmodule`, `fork`/`join`, `case`/`endcase`, …).
- **Auto-closing**: `()`, `[]`, `{}`, `""`, `/* */`.
- **Auto-indentation**: block bodies are indented after `begin`, `fork`,
  `module`, `class`, `function`, `case`, open brackets, and so on. Lines
  starting with `end*` / `join*` / closing brackets are outdented, and `else`
  aligns with its `if`.
- **Block snippets**: completing `begin`, `module`, `always_ff`, `always_comb`,
  `initial`, `function`, `task`, `class`, `case`, `if`, `for`, `fork`, … inserts
  the block together with its closing keyword.
- Comment toggling (`//`, `/* */`).

## Install (dev extension)

1. Open Zed's Extensions page (`zed: extensions`).
2. Click **Install Dev Extension** and select this directory.

Zed clones and compiles the grammar on first install. That takes a minute,
because the SystemVerilog parser is large.
