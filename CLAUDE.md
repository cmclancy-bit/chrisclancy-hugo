# Claude Code Instructions — chrisclancy-hugo

## Model delegation
When making code changes, use the `generate_code` tool (Gemma 4, local) to
write the implementation. Use your own reasoning for:
- Planning what changes to make
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
2. Use `generate_code` to write the change, providing the current file content
   as context in the prompt
3. Review the output, then apply it
4. Run `hugo server` locally to verify before committing
5. Commit and push to GitHub only after review

## Git
- Always write a clear, descriptive commit message
- Push to the main branch unless instructed otherwise
