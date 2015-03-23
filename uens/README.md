User Event Notification Script (uens)
=====================================

In a typical Linux system, systems events like dock/undock or suspend/resume
are handled by daemon processes running as root. These scripts enable the user
to listen for such events and execute commands within the current X session, so
that it is not necessary to manually set the DISPLAY environment variable.

This repository contains two scripts: `uens-listen` is run by the user and
`uens-send` is executed by a daemon process such as `systemd` or `acpid` on
specific events.

See below for a simple tutorial to lock the screen when the system is put to
sleep.

`uens-send`
-----------

This script should be called by `acpid` or `systemd` when an interesting
event (like dock/undock or suspend/resume) occurs. The source for the event
(`acpid` or `systemd`) should be passed as the first argument, the event
itself (and possibly more strings) as further arguments.  The arguments are
written to a logfile (`/var/run/uens/events.log`), together with a timestamp.

ATTENTION: When calling this script from `acpid`/`systemd` (as root), make
sure that the script itself is not writeable by any user. This can for example
be achieved as follows (run commands as root):

```shell
# cp uens-{send,listen} /usr/bin
# chown root:root /usr/bin/uens-{send,listen}
# chmod 755 /usr/bin/uens-{send,listen}
```

The script can be configured by writing values for the environment variables
used to `/etc/default/uens`.

For example, catching dock/undock events on a Lenovo Thinkpad X220 can be
processed by creating the following files:

`/etc/apci/events/uens-send-dock`:

```
event=ibm/hotkey LEN0068:00 00000080 00004010
action=/usr/bin/uens-send acpi dock
```

`/etc/apci/events/uens-send-undock`:

```
event=ibm/hotkey LEN0068:00 00000080 00004011
action=/usr/bin/uens-send acpi undock
```

It may be necessary to substitute the string `LEN0068` by `IBM0068` for older
Kernel or hardware versions.

In order to listen for suspend/resume events from `systemd`, create the file
`/usr/lib/systemd/system/uens-suspend-resume.service` with the following
content:
```
[Unit]
Description=User notification (uens) on suspend/resume
Before=sleep.target
StopWhenUnneeded=yes

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/uens-send systemd suspend
ExecStop=/usr/bin/uens-send systemd resume

[Install]
WantedBy=sleep.target
```

`uens-listen`
-------------

This script reads new lines from the log file created by `uens-send`. The
lines in that log file are formatted as follows:

```
TIMESTAMP SOURCE EVENT OTHER
```

When such a line is read, the script tries to execute all scripts within
`~/.config/uens/scripts/run-SOURCE-EVENT` and passes the `SOURCE`, `EVENT`
and `OTHER` strings as three arguments.

The script can be configured by writing values for the environment variables
used to either (in that order) `/etc/default/uens` or
`~/.config/uens/config`. Please read the source for details.

In order to execute a script when an acpi dock event occurs, just put (or
symlink) this script to `~/.config/uens/scripts/acpi-dock`.

Tutorial
========

In order to lock the screen with `i3lock` when the system is put to sleep
(suspended), you can utilise `uens` as follows:

 * Check out this git repository somewhere, e.g. to `~/uens`, and change to
   that directory.
 * Put the scripts `uens-send` and `uens-listen` somewhere safe and set
   ownership accordingly (as root):

```
# cp uens-{send,listen} /usr/bin
# chown root:root /usr/bin/uens-{send,listen}
# chmod 755 /usr/bin/uens-{send,listen}
```

 * Create `systemd` configuration file (as root):

```
# cat > /usr/lib/systemd/system/uens-suspend-resume.service <<EOF
[Unit]
Description=User notification (uens) on suspend/resume
Before=sleep.target
StopWhenUnneeded=yes

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/uens-send systemd suspend
ExecStop=/usr/bin/uens-send systemd resume

[Install]
WantedBy=sleep.target
EOF
```

 * Enable script in `systemd` (as root):

```
# systemctl enable uens-suspend-resume.service
```

 * Create the script to run and lock the screen when `systemd` emits the
   sleep signal (as user):

```
$ mkdir -p ~/.config/uens/scripts
$ cat > ~/.config/uens/scripts/run-systemd-suspend <<EOF
#!/bin/sh

i3lock -c 200020
EOF

$ chmod +x ~/.config/uens/scripts/run-systemd-suspend
```

 * Make sure that an instance of `uens-listen` is started for each X
   session, e.g. by adding the following lines to `~/.xsession` before the
   window manager is started:

```
uens-listen &
```

 * Done, that should do it.
