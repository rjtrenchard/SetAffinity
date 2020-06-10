SetAffinity
---
A small one-liner that sets pol.exe to a single core.
Useful if you notice stuttering on multi-core CPU's and want it automatically set.

Requires admin access without dimming UAC, or Windower to be run as an administrator.

In windows 10, if you experience crashes when a program asks for admin access you can change this by going here:

* control panel -> search UAC -> Change User Account Control Settings -> Adjust slider to "Notify me only when apps try to make changes to my computer (**do not dim my desktop**)"

This will leave UAC on for most things that try to modify your computer, but won't crash FFXI when it happens.

Powershell should already be installed if you are on Windows 10.
