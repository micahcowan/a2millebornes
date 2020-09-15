# a2millebornes
Mille Bornes card game for the Apple II

Based on original Apple II port by [hloberg](https://atariage.com/forums/profile/28093-hloberg/), posted at [this page on AtariAge](https://atariage.com/forums/topic/311214-mille-borne-in-applesoft-basic/). **hloberg**, in turn, based it on an Atari version he got some time ago, and does not know who the original author is.

If you don't know how to play this classic card game, you can find instructions [in this PDF file](https://atariage.com/forums/applications/core/interface/file/attachment.php?id=766604). Note that this port for the Apple II plays somewhat differently - in particular, the way Coup-Fourré works is currently very different (I hope to remedy this in the future).

## Building notes

If you want to modify or build from these sources, you will need these [tools for manipulating Apple DOS 3.3 filesystems](https://github.com/deater/dos33fsprogs)

NOTE: The **dos33fsprogs** project contains *many* different subprojects, most of which are *not needed* to build `MilleBornes.dsk`. The only subdirectories you must build, are `dos33fs-utils` and `asoft_basic-utils`.

Mille Bornes's Makefile assumes all of these tools are accessible from the current `PATH` environment variable.