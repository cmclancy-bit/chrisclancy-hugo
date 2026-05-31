---
title: How to install Ubuntu Server on a Mac Mini
slug: how-to-install-ubuntu-server-on-a-mac-mini
date: 2026-05-30
draft: true
description: ""
tags:
  - AI
  - Smart-Home
image:
emoji: 🖥️
---

<!--
  CHECKLIST BEFORE PUBLISHING:
  [ ] Title is clear and specific
  [ ] Slug filled in (lowercase, hyphenated, no punctuation)
  [ ] Description filled in (shows on homepage card)
  [ ] Tags added
  [ ] Image or emoji set (hero image: 1200×630px recommended)
  [ ] All inline images sized appropriately (max 1200px wide)
  [ ] draft: changed to false
-->

This is the setup guide for getting Ubuntu Server running on your home lab machine. If you're not sure why you'd want to do this in the first place, start with [Creating the ultimate home lab with Claude Code](/posts/creating-the-ultimate-home-lab-with-claude-code/).

---

- Use your primary computer to download the Ubuntu Server installer ISO from Canonical at ubuntu.com.
- You'll also need to download balenaEtcher (for macOS), or Rufus if you're using Windows to create the Ubuntu installer.
- You'll also need an 8GB or larger thumb drive for the installer, but if you're like me, you probably already have one of these in a drawer somewhere.
- Plug in your new server to power and Ethernet. Connect your Ethernet to a switch (if you have one), or any open LAN port on your router.
- Once you've created the installer, plug the thumb drive into your new server. To select the thumb drive as your boot drive you'll need to hold down a specific key on the keyboard until you see the boot options screen. If you're installing on a Mac hold the Option (⌥) key when you hit the power button. If you have a PC it varies depending on the brand, so look it up if you're unsure.
- When the server boots, follow the prompts to select the drive where you want to install Ubuntu. I could go through every detailed step of this process, but there are already plenty of fantastic resources on the subject (including the Ubuntu website itself) and it's fairly intuitive.
- If you have questions or issues during the process you can always chat with Claude (or another LLM) on your phone or main computer.
- After the install, your new Ubuntu server should start up, and you'll be greeted by the command line. Fear not, we're almost done with your part.
- One more step before we can put Claude to work. We need to give it the IP address of the new server so it can talk to it on your behalf.
- To get the address type ```hostname -I``` and hit Enter.
- You should see an address like 192.168.68.21 — the sequence you see will depend on your network. This is the IP address of your server. Take note of it.
- Finally, you'll need to go to your router and set a "static IP" address for the server so it will never change. Every router has a different UI, but most have this option. When you find it, you should see a list of devices on your network along with their IP addresses. Look for the one that matches the address from the previous step. Set it as static.

Once that's done, head back to the main guide and pick up at [Step 3: Claude takes the wheel](/posts/creating-the-ultimate-home-lab-with-claude-code/#step-3-claude-takes-the-wheel).
