# ChrisClancy.com – Setup Guide

## Prerequisites

Install Hugo (extended version recommended):

```bash
brew install hugo
```

Install Git if you don't already have it:

```bash
brew install git
```

---

## Local development

Run the local dev server from inside this project folder:

```bash
hugo server -D
```

Visit http://localhost:1313 — the site hot-reloads on every save.

The `-D` flag includes posts marked `draft: true`, so you can preview drafts locally before publishing.

---

## Writing posts (Obsidian workflow)

1. Open this project folder as your Obsidian vault (or point Obsidian at `content/posts/`).
2. Install the **Templater** community plugin in Obsidian. Point it at `archetypes/posts.md` as your default template.
3. Create a new note in `content/posts/`. The template auto-fills the frontmatter.
4. Write your post in Markdown as normal.
5. When ready to publish, change `draft: false` in the frontmatter.
6. Commit and push — the site deploys automatically (see below).

### Frontmatter reference

```yaml
---
title: "Your Post Title"
date: 2025-07-17        # publish date
draft: false            # true = invisible on live site
description: "One-sentence summary shown in post cards."
tags: ["Content Design", "Figma"]
image: "/images/my-post-image.jpg"   # optional hero image
emoji: "🎯"             # shown in card if no image
---
```

### Adding images

Drop image files into `static/images/` and reference them in frontmatter as `/images/filename.jpg`.

---

## Deploying to Cloudflare Pages (free)

### One-time setup

1. Push this project to a new GitHub repository.
2. Log in to [Cloudflare Pages](https://pages.cloudflare.com) (free account).
3. Click **Create application → Pages → Connect to Git**.
4. Select your GitHub repo.
5. Set the build configuration:
   - **Build command:** `hugo`
   - **Build output directory:** `public`
   - **Environment variable:** `HUGO_VERSION` = `0.136.0`
6. Click **Save and Deploy**.

From this point on, every `git push` triggers an automatic rebuild. Your post is live in ~20 seconds.

### Connecting your domain

In Cloudflare Pages → your project → **Custom domains**, add `chrisclancy.com` and `www.chrisclancy.com`. Cloudflare walks you through updating your DNS. You can keep your domain registered at Namecheap and just update the nameservers there, or transfer the domain to Cloudflare (also free for most TLDs).

---

## Automating git push from Obsidian

1. In Obsidian, go to **Settings → Community plugins → Browse**, search for **Git**, and install it.
2. Configure it to auto-commit and push on a schedule (e.g. every 10 minutes) or on a hotkey.
3. That's it — when you save a post with `draft: false`, the Obsidian Git plugin pushes to GitHub, which triggers a Cloudflare Pages build.

---

## Migrating your existing WordPress posts

1. In WordPress admin: **Tools → Export → All content** → download the XML file.
2. Install the WordPress plugin [wordpress-to-hugo-exporter](https://github.com/SchumacherFM/wordpress-to-hugo-exporter).
3. Activate it and go to **Tools → Export to Hugo**. It downloads a zip of Markdown files with frontmatter already set.
4. Drop the `.md` files into `content/posts/`.
5. Review each post's frontmatter (tags, dates, images) and clean up any shortcodes that didn't convert cleanly.
