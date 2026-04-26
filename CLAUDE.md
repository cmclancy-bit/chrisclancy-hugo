# Claude Code Instructions — chrisclancy-hugo

## Model delegation
Use `generate_code` (Gemma 4, local) to write all code implementations.
Gemma's output quality depends entirely on the context you provide — always
include the full contents of every relevant file in the prompt. For this project
that typically means:
- The current file being modified or the files it depends on
- The full `main.css` (or the relevant sections) for any template work
- The `baseof.html` and any partials involved
- Hugo variable names, CSS class names, and custom properties in use

Use your own reasoning for:
- Planning what changes to make
- Reading all relevant files before writing the Gemma prompt
- Reviewing Gemma's output for correctness before applying it
- Deciding when changes are ready to commit and push to GitHub

## Project overview
This is a Hugo static site. Key conventions:
- Templates live in `layouts/`
- Styles live in `assets/` or `static/` (check both)
- Content is in `content/`
- Config is in `hugo.toml` or `config.toml`

## Workflow for style/layout changes
1. Identify the relevant template or stylesheet file
2. Read all files Gemma will need to do the job correctly
3. Call `generate_code` with the full file contents and a precise description
4. Review the output, then apply it
5. Run `hugo server` locally to verify before committing
6. Commit and push to GitHub only after review

## Git
- Always write a clear, descriptive commit message
- Push to the main branch unless instructed otherwise
