---
title: Your Mac has a secret screenshot manager. Here's how to unlock it.
date: 2026-03-30
draft: false
description: How to use macOS Shortcuts and Apple Intelligence to automatically save, name, and organize your screenshots.
tags:
  - AI
  - Productivity
  - Tech Tips
image: /images/Zen.png
emoji: 📸
---

## Use Shortcuts and Apple Intelligence to take, access and organize your screenshots like a pro

Don't let your screenshots pile up on the Desktop or languish in some random folder with nothing more than a timestamp to distinguish them from one another. With Shortcuts and on-device AI you can have your Mac handle your screenshots in the most intelligent way possible — organized and easily accessible from anywhere.

---

## Clutter abounds. And there's no good reason for it.

I take hundreds of screenshots every day, and until recently those files littered my desktop creating visual and mental clutter. It was hard to justify spending the time to clean them up and often I'd just resort to deleting everything and then realize later on that it actually would have been valuable to have a reference of some of the work I'd done earlier in the week. I'll be going much more in-depth about versioning in another post.

My point is that all of this isn't necessary. Your computer was meant to take care of this on your behalf. One of the most interesting things about AI, not to get too far off track, is that it's really raised my expectations about what a computer can (and should) do to help you get your work done. I've spent so much of my career working on computers that seem kind of "compromised", that I've come to think of these kinds of inconveniences as just something to accept.

## How it's supposed to work

Unless you've been living under a rock (or you're a Windows or Linux user), you probably already know that the Mac has a number of ways you can automate a complex task. It's just that until *very* recently it could require a lot of trial and error. AppleScript, Automator, and shell scripting have been around for decades, but macOS Shortcuts and AI (literally everywhere) has sparked a completely new way of looking at and using these tools.

Now that I'm completely off track it's probably a good time to explain how you can *actually* solve the problem of managing your screenshots. So without further ado...

### Start by figuring out where you want to store screenshots

*This one thing* is probably the most important step you can take to clean up the clutter. If you don't do anything else, this one thing will keep things far more organized, and that is being intentional about where you put your screenshots in the first place.

By default, your Mac will dump screenshots on the desktop to add to what's likely already a cluttered mess to begin with. Because screenshots are images, and images are a kind of document, I choose to put mine in the Documents folder in my iCloud Drive. This gets them off the Desktop and into a more logical place where they'll also get backed up automatically.

![Screenshots folder saved in iCloud Drive Documents](/images/Pasted%20image%2020260330214824.png)

Just for ease of access, I also typically pin the Screenshots folder to the dock.

![Screenshots folder pinned to the Mac dock](/images/Pasted%20image%2020260330212424.png)

### Open the Shortcuts app

Next we're going to create a macOS shortcut that takes an interactive screenshot, saves it, and then uses Apple Intelligence to generate a descriptive filename and rename the file automatically.

If this seems too time consuming or you'd rather just cut to the chase, feel free to [download this shortcut](https://www.icloud.com/shortcuts/869172390aaf4564abe3d757b945c200) and switch up the file path to work with your setup.

1. Open the **Shortcuts** app on your Mac and create a new shortcut.
2. Name it **Screenshot Saver**, or whatever you like.
3. Add a **Take Screenshot** action.
4. Set the mode to **Interactive** and change Selection to **Custom**. This lets you select a specific region of the screen each time the shortcut runs.
5. Add a **Copy to Clipboard** action. This will automatically receive the **Screenshot** from the previous step, so you'll have it on your clipboard for pasting later.
6. Add a **Save File** action. Set it to save the **Screenshot** to the **Screenshots** folder you set up previously. Turn off **Ask Where to Save**, leave the Subpath at its default, and enable **Overwrite If File Exists**.
7. Add the **Get Detail of File** action. Set it to get **Detail** from the **Saved File** output of the previous step.
8. Add a **Use Private Cloud Compute model** action (aka Apple Intelligence). In the prompt field, type: `"Create a short, descriptive file name from the"` and then insert the **Screenshot** variable. After it, add: `"Do not enclose in quotes."`
9. Turn off **Follow Up** and set Output to **Text**. This sends your screenshot to Apple's on-device/private cloud model to generate the descriptive filename.
10. Add a **Text** action. Insert the **Response** variable from the Apple Intelligence step. This captures the AI-generated filename as a clean text value for the next action.
11. Add a **Rename File** action. Set it to rename the **Saved File** to the **Text** output from the previous step. This applies the AI-generated name to your screenshot file.
12. Run it a few times to make sure it's working the way you intend it to.

**It should look similar to this when it's done, minus the t-shirt image at the bottom.**

![Completed Screenshot Saver shortcut in the Shortcuts app](/images/2026-03-30_21-13-14.png)

That's it — when you run the shortcut, you'll be able to select your screenshot just as you normally would, but now it gets saved to your Screenshots folder, copied to your clipboard, and automatically renamed with an AI-generated description of its contents.

***You basically go from this...***

![Screenshots with default timestamp filenames](/images/Pasted%20image%2020260330212240.png)

***to this...***

![Screenshots with AI-generated descriptive filenames](/images/2026-03-30_21-24-22.png)

### But that's not all

Now you have the file with a descriptive title in a dedicated screenshot folder of your choice, and it's also saved in your clipboard. That means you can immediately paste it, or use a clipboard manager to paste it from your clipboard history later on. This is incredibly convenient.

### Just a few more details

Now that you have the power, how do you make it easy to remember and access? I recommend turning off your default keyboard shortcut (Shift + ⌘ + 4) and assigning it instead to the macOS shortcut you just created. This works best for me, since I've always used the default keyboard shortcut for screenshots, but you could also add it to the dock, pin it to the menu bar or add it to the services menu. Or all of these if you'd like.

![Reassigning the screenshot keyboard shortcut in the Shortcuts app](/images/Pasted%20image%2020260330222352.png)

## For some perspective

This workflow isn't something that would have been possible, *or even imaginable*, just a few years ago. The bigger story here is that in many ways, AI can really empower our work in big and small ways that make computers more useful than they've ever been before. And I think it can be easy to lose sight of this and get caught up in the hype or "doomerism" that we're constantly being subjected to around AI.
