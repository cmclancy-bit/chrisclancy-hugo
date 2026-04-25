---
title: Your Mac has a secret screenshot manager. Here's how to unlock it.
slug: your-mac-has-a-secret-screenshot-manager-heres-how-to-unlock-it
date: 2026-03-30
draft: true
description: How to use macOS Shortcuts and Apple Intelligence to automatically save, name, and organize your screenshots.
tags:
  - AI
  - Productivity
  - macOS
image: /images/Zen.png
emoji: 📸
---

## Use Shortcuts and Apple Intelligence to take, access and organize your screenshots like a pro

Don't let your screenshots pile up on the Desktop or languish in some random folder with nothing more than a timestamp to tell them apart. If you have an Apple Silicon Mac (M1+), you can use the Shortcuts app and on-device AI to have your Mac handle naming and saving your screenshots automatically.

---

## Clutter abounds. And there's no good reason for it.

I take hundreds of screenshots every day, and until recently those files were all over my desktop creating visual and mental clutter. It's a pain to clean them up. You never know what you're even looking at, and the effort required to figure it out just isn't worth it. 

My point is that your computer should take care of this for you. Most of us have spent our lives working on computers that seem kind of "compromised" when it comes to these things. After a while it's just something you learn to accept.

## How it's actually supposed to work

Unless you've been living under a rock (or you're a Windows or Linux user), you already know that macOS has ways you can automate a task like this. AppleScript, Automator, and shell scripting have been around for decades. But with AI we now have a completely new way of looking at this kind of problem. 

Previously it required a ton of trial and effort, and even after you got the automation to work reliably there was really no way for it to peer into every file to make sense of its contents. So the automation was too dumb to know how to handle them anyway. Those days are over.

### What to do first

Start by figuring out where you want to store screenshots. *This one thing* is probably the most important step you can take to clean up the clutter. Just being intentional about where you put your screenshots in the first place.

By default, your Mac will dump screenshots on the desktop to add to what's probably already a cluttered mess. Because screenshots are images, and images are a kind of document, I choose to put mine in the Documents folder in my iCloud Drive. This gets them off the Desktop and into a more logical place where they'll also get backed up automatically.

![Screenshots folder saved in iCloud Drive Documents](/images/Pasted%20image%2020260330214824.png)

For ease of access, I also like to keep my Screenshots folder in the dock.

![Screenshots folder pinned to the Mac dock](/images/Pasted%20image%2020260330212424.png)

## Enter the Shortcuts app

Next we're going to create a macOS shortcut that takes an interactive screenshot, saves it, and then uses AI to generate a descriptive file name and rename it automatically based on its contents.

If you'd rather skip ahead, feel free to [download the shortcut](https://www.icloud.com/shortcuts/869172390aaf4564abe3d757b945c200) and switch up the file path to work with your setup. 

1. Open the **Shortcuts** app on your Mac and create a new shortcut.
2. Name it **Screenshot Saver**, or whatever you like.
3. Add a **Take Screenshot** action.
4. Set the mode to **Interactive** and change Selection to **Custom**. This lets you select a specific region of the screen each time the shortcut runs.
5. Add a **Copy to Clipboard** action. This will automatically receive the **Screenshot** from the previous step, so you'll have it on your clipboard for pasting later.
6. Add a **Save File** action. Set it to save the **Screenshot** to the **Screenshots** folder you set up previously. Turn off **Ask Where to Save**, leave the Subpath at its default, and enable **Overwrite If File Exists**.
7. Add the **Get Detail of File** action. Set it to get **Detail** from the **Saved File** output of the previous step.
8. Add a **Use On Device model** action (aka Apple Intelligence). In the prompt field, type: `"Create a short, descriptive file name from the"` and then insert the **Screenshot** variable. After it, add: `"Do not enclose in quotes."` **Note:** When choosing a model you may need to make adjustments. **Extension: ChatGPT** is more reliable, **On-Device** is faster, and **Private Cloud Compute** is typically somewhere in between.
9. Turn off **Follow Up** and set Output to **Text**. This sends your screenshot to Apple's on-device/private cloud model to generate the descriptive filename.
10. Add a **Text** action. Insert the **Response** variable from the Apple Intelligence step. This captures the AI-generated filename as a clean text value for the next action.
11. Add a **Rename File** action. Set it to rename the **Saved File** to the **Text** output from the previous step. This applies the AI-generated name to your screenshot file.
12. Click the info icon in the side panel and select "Use as Quick Action" and "Services Menu". **Important:** Do not assign a keyboard shortcut in this step. We'll get to that later.
13. Run it a few times to make sure it's working the way you intend it to.

**It should look similar to this when it's done, minus the t-shirt image at the bottom, of course.**

![Completed Screenshot Saver shortcut in the Shortcuts app](/images/2026-03-30_21-13-14.png)

That's it — when you run the shortcut, you'll be able to select your screenshot just as you normally would, but now it gets saved to your Screenshots folder, copied to your clipboard, and automatically renamed with an AI-generated description of its contents.

***You basically go from this...***

![Screenshots with default timestamp filenames](/images/Pasted%20image%2020260330212240.png)

***to this...***

![Screenshots with AI-generated descriptive filenames](/images/2026-03-30_21-24-22.png)

## But that's not all

Now you have the file with a descriptive title in a dedicated screenshot folder of your choice, and it's also saved to your clipboard. That means you can immediately paste it, or use a clipboard manager to paste it from your clipboard history later on. This is *incredibly* convenient.

### Just a few more details

Now that you have the power, how do you make it easy to remember and access? I recommend turning off your default keyboard shortcut (Shift + ⌘ + 4) and assigning it instead to the macOS shortcut you just created.

This works best for me, since I've always used the default keyboard shortcut for screenshots, but this is totally optional. You could just add it to the dock, pin it to the menu bar or add it to the services menu. Or all of these.

One caveat to be aware of is that the responsiveness of your shortcut can vary depending on a few factors. The model you choose plays a big role, and may be faster or slower depending on your Mac and your network speeds. If the shortcut is less responsive than you'd like, switch the model and try again.

### Keyboard shortcut setup

First, you'll want to be sure to deactivate your default keyboard shortcut for taking a screenshot of a selected area, so you can assign it to the new macOS Shortcut you just created. Be aware that there's a specific order to follow when you do this to make it work reliably.

1. Go to Settings > Keyboard > Keyboard shortcuts > Screenshots
2. Deselect "Save picture of selected area as file"
![Reassigning the screenshot keyboard shortcut in the Shortcuts app](/images/Pasted%20image%2020260330222352.png)
3. Next, you need to set up the new keyboard shortcut. 
4. Go to **Services** and choose the screenshot Shortcut you just created.
5. Select the shortcut field on the right and type "Shift + ⌘ + 4"
6. Click **Done**.


![Keyboard shortcut assignment for Screenshot Saver in macOS System Settings](/images/Saver_Shortcut.png)
## For some perspective

This workflow isn't something that would have been possible, *or even imaginable*, just a few years ago. The bigger story here is that in many ways, AI can really empower our work in big and small ways that make computers more useful than they've ever been before.

There are already loads of incredibly legitimate and useful AI-powered tasks that you can use to make your life easier and more organized. And increasingly they'll be powered on device, just like this one.