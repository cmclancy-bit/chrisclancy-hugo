# Claude Code Instructions — chrisclancy-hugo

## Model delegation
Do NOT use `generate_code` (Gemma) for Hugo templates, CSS, or any code that
depends on the existing codebase. Gemma lacks context about the theme's CSS
classes and Hugo conventions, and its output will require full rewrites.

Use `generate_code` only for self-contained tasks that don't depend on existing
project code, such as:
- Standalone bash or shell scripts (e.g. image resizing, file renaming utilities)
- One-off Python or JS utilities described from scratch
- Boilerplate that has no dependency on the theme or Hugo

For everything else — templates, CSS, config, content edits — write it directly.

## Project overview
This is a Hugo static site. Key conventions:
- Templates live in `layouts/`
- Styles live in `assets/` or `static/` (check both)
- Content is in `content/`
- Config is in `hugo.toml` or `config.toml`

## Workflow for style/layout changes
1. Identify the relevant template or stylesheet file
2. Make changes directly — do not route through Gemma
3. Run `hugo server` locally to verify before committing
4. Commit and push to GitHub only after review

## Git
- Always write a clear, descriptive commit message
- Push to the main branch unless instructed otherwise
