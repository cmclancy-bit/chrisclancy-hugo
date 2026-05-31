---
title: Creating the ultimate home lab with Claude Code
slug: creating-the-ultimate-home-lab-with-claude-code
date: 2026-05-30
draft: true
description: ""
tags:
  - AI
  - Smart-Home
image:
emoji: ✍️
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


 Claude Code can set up and maintain your home lab like a pro. With just a small investment in hardware, and free, open source downloads, Claude can do your install and act as your system admin for little to no money.


---

## Professional-grade services on your terms

You don't need to be an expert, and you don't need to hire one, you just need to do some initial setup and let Claude take care of the rest. 

## How to get started

#### The setup, starting with the hardware

First, you'll need a dedicated machine to make the process as seamless as possible – ideally a small, low-power mini computer with an Intel or AMD processor. Anything that will run Linux will do, so the choices are kind of limitless, but I'd recommend an older Mac Mini for this.

I went with a 2014 Intel Mac mini with a Core i7 processor and 16GB of RAM. More RAM is better if you can swing it, since that will allow it to run more services without bogging down the system.

Built-in Ethernet is also highly recommended, especially if you can put the server near your router or a wired switch. Because the machine needs to be connected to your network and powered on 24/7, Ethernet is preferred over any type of wireless connection.

#### What software do you need?

This is really the best part of the setup. You'll be running open source software. It won't cost you a dime, and it's actively developed and distributed by an army of enthusiasts.

The only question you need to ask yourself is what do you want your home lab to do for you? Whatever it is, there's an open source solution, starting with the most important part, the operating system (OS).

If you're like most people the thought of running a "server" can be intimidating, and especially when that server running Linux. This is where Claude really changes the entire equation, but we'll get to that later.

It's probably better in this case not to think about the software you need, but instead, ask yourself what you want to do with your setup in the first place. The solutions are out there, and readily available, but to get started you need to decide this first.

#### I'm intrigued, tell me more

This is the best part. Shopping for all the new (free) tools you want for your setup.

- **Media servers:** Replace streaming services with locally hosted content. This typically requires some extra storage, but it's well worth it if you're looking dump your music and video subscriptions. This the number one use case for most people, and only requires a little additional hardware and effort to set up.
- **Ad blocking and privacy:** If you're anything like me it creeps you out that so much of your online life is tracked, recorded and sold to the highest bidder. Running a self-hosted ad blocker and VPN is one way to take more control of your digital life.
- **Home automation:** It's probably the best way to get into automation in the least expensive, most hassle-free, privacy-first way possible. 
- **Sync and backup:** Sure you *could* buy a NAS, but plugging in a cheap external hard drive to your home server is going to get you way more bang for your buck. Back up your files and access them from multiple machines without putting your sensitive data in a cloud where it could get harvested for training or even more nefarious purposes.
- **Remote access:** Run software that let's you access all of the aforementioned services when you're away from home. Imagine streaming that show you've been meaning to watch for weeks on the train ride to work – but 100% ad free, remotely accessing a Mac Mini and using it from an iPad at the coffee shop, or grabbing a file from your desktop at home while at work or in another country. So many possibilities!
- **Containers:** You can run some pretty interesting and useful things inside a Docker container. For example, you can run a full-on version of Chrome that's 100% anonymous. Because you spin it up for one-time use it's ephemeral. You'll never use the same pattern twice. Combine that with a VPN and sites can't cookie or fingerprint you. Your browser is unique and it's running on a clean OS every time you use it. This can be incredibly helpful when your trying to avoid algorithmic price tracking and other forms of surveillance capitalism.

## Sounds pretty great, but how?

#### Step 1: Get a Claude Pro subscription

For now at least, you'll need a Claude Pro subscription. Pro is required to use Claude Code, and you absolutely do need Claude Code for this. The reason is simple. Claude Code can "see" and interact with the computers on your network, and this is what makes this whole process worth doing in the first place.

Next, be sure to install the Claude app, or Claude CLI. You can download it from the claude.ai website, or install via Brew on on macOS if you're comfortable using the command line.

#### Step 2: Setting up your server

Getting Ubuntu Server installed is its own adventure, so I put together a dedicated guide: [How to install Ubuntu Server on a Mac Mini](/posts/how-to-install-ubuntu-server-on-a-mac-mini/). Follow that and come back here once your server is up and you have its IP address in hand.

#### Step 3: Claude takes the wheel

 Next, make sure you've installed Claude Code on your primary computer, and that you're connected to the same network as the new server (for example, you're on a laptop connected via wifi and your server is plugged into the router via Ethernet).

Open a command line application. On macOS the app you need is called Terminal. On Windows it's called Windows Terminal. Type ```claude```, hit Enter, and you're in business! Claude is waiting for your commands.

The next step is to give Claude SSH access to the server. This process is called SSH key-based authentication (or just "SSH key setup"). It sets up your computer and the server so they remember each other so you (and Claude) can access the server and make changes without entering a password.

Claude will walk you through this process. 

Paste the following prompt into the terminal and hit Enter:

``` 
I want to set up a self-hosted home server on Ubuntu. Help me install Docker and configure the following services using Docker Compose:

- Pi-hole — DNS-level ad blocking for the whole network
- Nginx Proxy Manager — reverse proxy with automatic SSL certificates so
services are reachable by domain name (e.g. music.example.com)
- Tailscale — VPN mesh so I can reach the server securely from anywhere (run it as a Docker container)
- Navidrome — self-hosted music streaming server, accessible via the reverse proxy and exposed on port 4533
- Jellyfin — self-hosted media server for movies and TV shows
- Home Assistant — home automation hub
- Uptime Kuma — dashboard to monitor whether all my services are up
- Watchtower — automatically pull and restart updated container images on a nightly schedule
- ARM (Automatic Ripping Machine) — rip CDs and DVDs automatically when inserted

Before setting up services, walk me through SSH key-based authentication so I can log in to the server without a password.

For each service, provide the docker-compose.yml snippet and any first-time setup steps. Make sure Navidrome's port binding is 0.0.0.0:4533 (not 127.0.0.1) so Tailscale traffic can reach it. Walk me through connecting from my phone via Tailscale once everything is running.

```





