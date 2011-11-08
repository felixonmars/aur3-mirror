About iBored, version 1.1.8
Written by and Copyright © 2006-2011 Thomas Tempelmann
http://apps.tempel.org/iBored/

This is a free program for Mac OS X, Windows and Linux. It was formerly
released under the name rohPod. It is basically a hex editor for disk
sectors, but can also be used to edit files, including disk images.
This program comes with hardly any documentation, and it doesn't explain
what it does, either. If you have not used other tools to edit disk blocks
or files on a binary level before, you may find it difficult to use.

Beware: This tool lets you mess with your disk contents in a rather
unsafe manner: You can easily write over any data on a disk, rendering
the entire disk unusable. So you better know what you're doing,
especially if you use any "write" operations. And keep backups of your
data on other disks.

I wrote this tool mainly for my own use. However, I like to share it
with those who know what it's good for. If you can't deal with it, don't
complain. It's free. Choose it or lose it.

OTOH, if you need help with it, or even need improvements, and are
willing to pay for my services, get in contact (see end of this document).


Features

* Can view disks in custom block sizes.
* Deals gracefully with read errors: You can copy a partially-damaged disk
to an image file (bad blocks will become zero-filled in the copy) in
order to use recovery tools on the error-free copy then.
* When modifying data, a "journal" file is written to your desktop that
contains the previous data of the altered blocks, and it can be used to
undo your changes.
* Can view partitions and other subranges as containers with their own
start, length and block size.
* Can be re-launched with admin (root) rights to access non-removable
disks (Mac OS X only).
* Detects connected iPods, showing their firmware partition contents.
* Can access disks remotely over a network connection.
* Can save a range of blocks to a file and write a file back to disk.
* Has a powerful template system to view and analyse disk structures.
* Can edit MBR and GPT partition tables.
* Can install a PC BIOS bootloader dealing with both MBR and GPT.


Limitations

Some operations are only implemented for Mac OS X, not Windows nor Linux.
Hardly any testing has been done on Linux and Windows, lately. If basic
operations (read, modify, write) fail, let me know! Templates are limited,
and some operations may only work under certain conditions - I've often
only implemented them as far as I needed them for a particular case.


Usage

A few hints:


Linux

Be aware that you will not get to see any disks unless you launch
this program with root permissions. I assume you know how to do that.


Working with files

By default, only disks are listed in the "Disks" window. To edit a
file, simply drop it into the Disks window and it will appear like a
disk in the list.


Writing data

Making modifications to data on a disk requires you to "enable writing"
first. If you're editing a block in the hex viewer, you can enable
writing via the menu. This will attempt to unmount the disk first. If
that fails, e.g. due to open files on a disk's volume, writing won't
be enabled.

If writing gets enabled successfully, a journal file will be written
to your desktop folder whenever you save a modified block in the hex viewer.

However, if you're going to overwrite multiple blocks using Write File
to Blocks, no journal will be written! Thus be careful where you write
your data to as there's no simple undo available afterwards.


Using the Journal

As long as there is a journal file in your desktop folder, you can use
the Show Journal command from the menu if a disk is selected in the
Disks window (or if you have some other disk-specific window open).
You can then select single or several entries from the journal and
choose to view them or write them back to the disk in the place where
they were saved from. Thus, after making modifications to a disk, you
could Select All entries in the journal to undo all your changes.

After writing back blocks from the journal the journal will remove
those blocks so that it's clear which blocks are still modified.

Note that the journal is only written if you modify blocks individually
using the hex editor, but not if you perform multi-block modifications
such as via the Write File to Blocks command!


Remote access (via network)

To use this feature, iBored needs to be launched on both computers and at
least one side has to be reachable via IP directly (i.e. if it's behind
a router, port forwarding must be installed).

To connect the two computers, choose Connect... on both. The computer that
is directly reachable should use the "Listen" mode, the other can then connect to it.

After both are connected, either side can use the menu command Show Remote Disks
to view the other side's accessible disks. From there on, it functions like
accessing local disks, mostly. A few differences exist:

The user whose disks are examined will be asked to confirm the following
operations once:
* View the list of his disks
* Read a particular disk
* Enable writing on a particular disk

If the user does not confirm the operation, the request will fail on the
other end, of course. Additionally, either side may terminate the connection at any time.

Modifications can only be done via the Block (hex) viewer – multi-block write
operations such as Write File to Blocks to not work via the network (yet).
Reading a bunch of blocks over the network with the Write Blocks to File
command works, though.

If a modification is done remotely, the journal will be written on the computer
where the modification is performed. That way, the user still has it under
control to undo all changes later again.

Both sides can view the same data. If the remote side makes a change, the
windows on both sides will update to show the new data. However, if the local
side makes a change, the remote sides' view will not automatically be updated
(this is not by design but rather by lack of my effort to do this right).

This all means: if a user gives someone else access to his disk, he can
make sure that the remote user can't read data from disks he doesn't want
to be read, and he can also prevent the remote user from making modifications
without his consent. Even if the remote user makes modifications, the local
user still can undo these changes later again via the Journal. Hence, the
user is pretty safe from having unrepairable harm done to his data. 
At least, that's how I've designed the remote access. (If you find any
loopholes in this, let me know so that I can fix them ASAP.)


Templates

Some data is auto-detected when viewed in the hex editor - then the view
switches from hex view to the template view. In template view, structured
data appears interpreted. For example, a MBR (master boot record) of a
typical Windows formatted disk will show the four partition entries with
block numbers and other values.

Currently, the template view does not allow you to modify entries. You will
have to note the offset and size of an entry and then switch back to the hex
view to make modifications.

Sometimes there may be more than one potentially fitting template. Those
that might fit have a little dot in front on them in the popup menu of
the Templates view.

If you like to add more templates yourself, have a look at the file
iBored-templates.xml, which is either next to the application, or, on Mac OS X,
inside the package in Contents/Resources. It is organically grown and there is
currently no documentation on what parameters is allows. But maybe you can
learn from looking at the present information. Otherwise, contact me, and I
might make an effort to document it better.


Specific commands from the menus

Run As Root (Mac OS X only):
asks for an administration login & password, then re-launches iBored with
root permissions so that all disks, including the root volume, can be accessed.

View Structure:
Relies on context entries in the templates xml file to analyse the structure
of a disk. Starting at the partition table, it shows a hierarchical view of
the various containers (e.g. each partition with its volume and maybe even
its directory). May work or not work for your kind of disk as the structures
in the templates file are not complete yet for all file systems.

View Partitions:
Uses hard-coded routines (i.e. not the templates file) to list the partitions of a disk.

View Subrange:
Opens a new view for a range of a disk's blocks, with a user-defined block size.

Write Blocks to File:
Writes a subrange of blocks to a user-chosen file.

Write File to Blocks:
Writes a file to a range of blocks. The writing always starts with the first
block of the file, i.e. you cannot currently choose to write only a subrange
of a file that doesn't start at the beginning of the file. You can, however,
choose only to write a certain number of blocks from the file to the disk.

Backup used Blocks: Tries to write a compressed disk image from a disk or
subrange view, where only blocks are written that are marked "in use" by
the volume format. For instance, if applied to a FAT formatted disk, only
the MBR, the FAT blocks, the root directory and any blocks marked used by
the FAT are written. The written file uses the same format as a journal file,
BTW. Note that this only works with a few formats, though, such as (currently)
FAT16 and FAT32.

Fix Partition Size:
A function I once needed to fix overlapping partitions on Linux-formatted
iPods. Only enabled if a partitions view shows red fields. May not fix it
the way you expect, so better not use it unless you like to experiment
(or have backups).

Check Volume Structure: 
A function to repair a partially damaged FAT volume. It has some hard-coded
values in it currently, making it useless for general use.

drutil output (Mac OS X only):
invoked the command line tool drutil which interprets a block's data.


Preferences

There are no preferences (persistent options) to set in this application
(yet), hence the Preferences menu is always disabled.


Version History

1.1, 17 Jan 09:
• First release (after releases of versions 1.0.x in 2006 as "rohPod")
1.1.1, 3 July 09:
• Improved hex copy/paste under Windows (thanks to Craig Peterson from scootersoftware.com)
• Added various partition table modification functions.
1.1.2, 19 Feb 10:
• Can enable writing on unmountable OSX volumes now.
• Can copy blocks from disk to disk.
• Fixed erroneous unmount warnings on OS X 10.6.
1.1.4, 23 May 10:
• Scan operation (formerly "Bad block scan") can now report empty block ranges.
• "View Structure" operation fixed so that it works properly now with "context"
  entries in Templates.
• Added a "summary" feature to Templates, which is now used to keep many
  structures closed, showing a summary of their contents instead.
• Doesn't crash on PPC Macs any more (had to disable Templates for that,
  unfortunately).
• Many other little improvements.
1.1.5, 10 Dec 10:
• Scan operation expanded: Can now run a custom script on every block, and can backwards.
• GPT support improved for manual Boot Camp installation (still a bit incomplete, though).
• Scripting and Templates documentation included now.
1.1.6, 27 May 11:
• Added Scripting chapter to this documentation.
• Fixed "Scan..." operation for used blocks when working on subranges with non-physical block sizes.
• Fixed a potential hard crash in "TemplateView.TemplateView.selectRange" when switching to Template view.
• HFS+ catalog file is now using the correct nodeSize when opened from the Structure window.
1.1.7, 19 Jul 11:
• Fixed Remote Disk access - no more internal error when trying to view the remote disks.
• No more "$$" where one $ is enough as a lead-in for hex values.
1.1.8, 21 Jul 11:
• Fixed Templates matching related potential crash and occasional misses.

Acknowledgements

This tool uses the "MacWindowMenu" and "MacOSLib" classes by Charles Yeomans.
It also uses an improved version of Brady Duga's HexEditCanvas.


Questions, Feedback, Contact

I am a freelancer, and I am always open to contract work offers in areas such
as data rescue, data conversion, file systems and more that is not related
to web design and programming, UI programming and so on - I'm more the low
level kind of programmer.

Similarly, if you need custom features implemented in this app and are
willing to pay for them, get in touch.

	To contact me, write to tempelmann@gmail.com
	The app's website is: http://apps.tempel.org/iBored/

And now, I hope you enjoy using iBored.