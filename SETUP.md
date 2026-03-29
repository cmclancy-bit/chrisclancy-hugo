# ChrisClancy.com – Site Guide

## How the site works

This is a [Hugo](https://gohugo.io) static site. You write posts in Markdown (in Obsidian), push to GitHub, and Cloudflare Pages automatically builds and deploys the site in ~20 seconds.

```
Obsidian → GitHub → Cloudflare Pages → chrisclancy.com
```

---

## Local development

Run a live preview server from this folder:

```bash
hugo server -D
```

Visit http://localhost:1313. The site hot-reloads on every save. The `-D` flag shows posts marked `draft: true` so you can preview before publishing.

---

## Writing posts

### Where posts live

| Section | Folder | Shows up on |
|---------|--------|-------------|
| General writing / Content Design | `content/posts/` | Homepage + Content Design nav |
| AI | `content/ai/` | Homepage + AI nav |
| Etc. | `content/etc/` | Homepage + Etc. nav |

Create a new `.md` file in the appropriate folder. The filename becomes the URL slug — use hyphens, no spaces (e.g. `my-new-post.md` → `chrisclancy.com/posts/my-new-post/`).

### Frontmatter

Every post starts with a frontmatter block:

```yaml
---
title: "Your Post Title"
date: 2026-03-29
draft: true
description: "One sentence shown in post cards and search results."
tags: ["Content Design", "AI"]
image: "/images/your-image.png"
emoji: "💡"
---
```

| Field | Required | Notes |
|-------|----------|-------|
| `title` | Yes | Shown in cards and browser tab |
| `date` | Yes | Controls sort order on homepage |
| `draft` | Yes | `true` = hidden on live site, `false` = published |
| `description` | Recommended | Shown in post cards and as meta description for SEO |
| `tags` | Recommended | Used for the filter pills on the homepage |
| `image` | Optional | Hero image — see image guide below |
| `emoji` | Optional | Shown in post card if no image |

### Tags

Tags are free-form but try to stay consistent. Current tags in use:
- `Content Design`
- `Figma`
- `Productivity`
- `Tech Tips`
- `AI`

Tags appear as filter pills on the homepage. New tags appear automatically.

### Draft workflow

- `draft: true` — post is pushed to GitHub but invisible on the live site
- `draft: false` — post is live as soon as the next Cloudflare build completes

You can write and iterate freely with `draft: true`. Flip to `false` when ready to publish.

---

## Images

### Where to put them

Drop image files into `static/images/`. Reference them in frontmatter as `/images/filename.png`.

### Recommended sizes

| Use | Aspect ratio | Recommended size | Max file size |
|-----|-------------|-----------------|--------------|
| Post hero / card image | 16:9 | 1600 × 900px | 500KB |
| In-article image | Any | Up to 1200px wide | 300KB |

**Format:** Use `.jpg` for photos, `.png` for screenshots or graphics with transparency.

**Why 16:9?** Post cards on the homepage display images at 16:9. If your image is a different ratio it will be cropped to fit. Centering your subject helps avoid awkward crops.

**File size:** Smaller files load faster. Aim to keep hero images under 500KB. Tools like [Squoosh](https://squoosh.app) or Mac's Preview (Export → adjust quality) can compress without visible quality loss.

### In-article images

To embed an image inside a post (not just as a hero), use standard Markdown:

```markdown
![Alt text describing the image](/images/your-image.png)
```

Always write descriptive alt text — it helps screen reader users and SEO.

---

## Deploying

The pipeline is fully automatic once set up:

1. Save your post in Obsidian (Obsidian Git auto-commits and pushes on a schedule)
2. GitHub receives the push
3. Cloudflare Pages detects the change and runs `hugo`
4. Site is live at chrisclancy.com in ~20 seconds

To trigger a deploy manually (e.g. if auto-sync hasn't run yet), use Claude Code:

```
push the latest version of the site to github
```

---

## Customizing the design

### Key files

| File | What it controls |
|------|-----------------|
| `hugo.toml` | Site title, tagline, description, navigation menu |
| `themes/chrisclancy/static/css/main.css` | All visual styling |
| `themes/chrisclancy/layouts/partials/header.html` | Navigation bar |
| `themes/chrisclancy/layouts/partials/footer.html` | Footer |
| `themes/chrisclancy/layouts/index.html` | Homepage layout |
| `themes/chrisclancy/layouts/_default/single.html` | Individual post layout |
| `themes/chrisclancy/layouts/_default/list.html` | Section page layout (AI, Etc.) |

### Changing the tagline or description

Edit `hugo.toml`:

```toml
[params]
  tagline    = "Putting words to work."
  description = "Content design, UX, AI, and anything else I can't stop thinking about."
```

### Adding a nav item

Add a new `[[menus.main]]` block in `hugo.toml`. The `weight` controls order (lower = further left):

```toml
[[menus.main]]
  name   = "New Section"
  url    = "/new-section/"
  weight = 25
```

### Light and dark mode

The site follows the user's system preference by default. Users can override with the sun/moon toggle in the nav bar. Their preference is saved across visits.

To change the accent color, edit `--red` in `main.css`. In light mode the accent is blue (`#2563eb`); in dark mode it's red (`#e02020`).

---

## Hugo basics

Hugo builds the site from three things:

- **Content** (`content/`) — your Markdown posts
- **Layouts** (`themes/chrisclancy/layouts/`) — HTML templates that wrap your content
- **Static** (`static/`) — files served as-is (images, fonts, etc.)

When you run `hugo`, it combines these into a static `public/` folder that Cloudflare serves.

**Sections** are top-level folders inside `content/`. Each section gets its own URL and list page. The `_index.md` file in each section sets the title and description for that section's page.

**Regular pages** are individual `.md` files — your actual posts. They inherit the layout from `themes/chrisclancy/layouts/_default/single.html`.

---

## Troubleshooting

**Post not showing on live site**
- Check `draft: false` in frontmatter
- Check the date isn't in the future
- Make sure the file is in a section folder (`posts/`, `ai/`, `etc/`) not floating at the root of `content/`

**Image not showing**
- Confirm the file is in `static/images/`
- Check the path in frontmatter starts with `/images/` (leading slash required)
- Filename is case-sensitive — `My-Image.png` ≠ `my-image.png`

**Changes not appearing on chrisclancy.com**
- Check the Cloudflare Pages dashboard for a recent successful build
- Try a hard refresh: Cmd+Shift+R
- If still stale: Cloudflare → Caching → Purge Everything
