# Claude Code Instructions — chrisclancy-hugo

## Model delegation
Write all code directly — templates, CSS, config, content edits.

Only use `generate_code` (Gemma 4, local) for standalone scripts that have no
dependency on the existing codebase, such as:
- Bash/shell utilities (e.g. image resizing, batch file renaming)
- One-off Python or JS scripts described from scratch

## Project overview
This is a Hugo static site. Key conventions:
- Templates live in `layouts/`
- Styles live in `assets/` or `static/` (check both)
- Content is in `content/`
- Config is in `hugo.toml` or `config.toml`

## Workflow for style/layout changes
1. Identify the relevant template or stylesheet file
2. Make the change directly
3. Run `hugo server` locally to verify before committing
4. Commit and push to GitHub only after review

## Git
- Always write a clear, descriptive commit message
- Push to the main branch unless instructed otherwise
