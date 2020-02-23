# open-speedcube-timer

## What and Why?

Open Speedcube Timer (ost) is an offline, crossplatform, speed cube timer. Whether you are timing a full solve or parts of a solve you can categorize and store your times for personal tracking and analytics.

Most speedcube timers require an internet connection which some struggle to have at all times. This project is meant to fill that need while being completely free to everyone.

## What does ost do?

ost can..

- start timing once space is released after being held for 1 second or more
- stop timing (if already timing) if any key is pressed on a keyboard
- work on Windows, Linux, and Mac operating systems

## What will ost do soon?

ost will..

- show a wca compliant scramble (if enabled)
- give you the ability to add/remove custom categories for time logging (such as "F2L only", "Roux First Block", "OLL", etc)
- log data to a folder based on the category (one file per category) (A single file could be used but for keeping things clean I believe this would be the best option)
- give you an interface to preview statistics of your solves based on your categories (or multiple categories (CFOP or ZZ or ROUX full solves alone or all data combined))
- look fantastic

## Technical Notice

This application was written in [LOVE2D](https://love2d.org/) for a few reasons. Some reasons include ease of development, previous experience with the engine, simplicity for others to help (lua is not a difficult language to learn) and how LOVE handles time. Being a program written for operating systems, some of which I don't have access to (Mac currently), I have no way of testing certain executables for certain operating systems. I need help testing these executables for those who have hardware I do not. This code will work on Mac, Linux, and Windows if built from source; however, I would like to offer executables so more people can have access to ost. I will do my best to post executables asap and to re-release them as ost changes.