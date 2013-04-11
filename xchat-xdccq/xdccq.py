#!/usr/bin/env python

# written by jmoiron, jmoiron.net
# licensed under the GNU GPL v2
# a copy of the license can be found:
#   http://www.gnu.org/licenses/gpl.txt
#
# version 0.6:
#   - added 'step' to pack list
#   - special thanks to Jan Malakhovski 
#     for the patch for this feature
#
# To contact me, replace the ',' on the
# written by line above with an @, or
# paste this into a python shell:

email_address = 'am1vaXJvbkBqbW9pcm9uLm5ldA==\n'.decode('base64')

class Xchat(object):
    """Fake xchat object.  For testing via command line."""
    def __nonzero__(self):
        """Make this boolean False:
        >>> bool(Xchat())
        False
        """
        return False
    def prnt(self, s):
        s = s.replace('\00302', '')
        s = s.replace('\00303', '')
        s = s.replace('\002', '')
        s = s.replace('\003', '')
        print s
    command=prnt
    def __getattr__(self, name):
        def lambda_(*x, **y):
            print '%s: %s, %s' % (name, x, y)
        return lambda_

try: import xchat
except ImportError: xchat = Xchat()

import sys
import re
from exceptions import ValueError

__module_name__ = "xdccq"
__module_version__ = "0.6"
__module_description__ = "Xdcc Queue"

# to enable some debugging output, set to True
__debugging__ = False

colors = {
    'black'   : '01', 'dkblue' : '02',  'dkgreen' : '03', 'red'     : '04',
    'brown'   : '05', 'purple' : '06',  'orange'  : '07', 'yellow'  : '08',
    'ltgreen' : '09', 'aqua'   : '10',  'ltblue'  : '11', 'blue'    : '10',
    'violet'  : '13', 'grey'   : '14',  'ltgrey'  : '15', 'white'   : '16'
}

# for americans
colors['gray'], colors['ltgray'] = colors['grey'], colors['ltgrey']

if __debugging__:
    import traceback

def pcolor(string, color):
    colorstr = '\003%s' % colors.get(color, 'black')
    print colorstr + str(string) + '\003'

def print_debug(string):
    if __debugging__:
        pcolor(string, 'orange')

def print_error(string): pcolor(string, 'red')
def print_help(string): pcolor(string, 'blue')
def print_success(string): pcolor(string, 'dkgreen')
def echo(string): pcolor(string, 'ltblue')

print_info = print_success

cmd_help = {}
gen_help = [
    "\037[help, ?]\037 <cmd>    - prints this help or detailed help for 'cmd'\n",
    "\037[ls, list]\037         - lists files in queue\n",
    "\037get\037 [bot] [#, #-#] - adds 'send' cmds to queue\n",
    "\037rm\037 [bot] <#, #-#>  - removes 'send' cmds from queue\n",
    "\037[cancel,stop]\037      - cancels current transfer\n",
    "\037multiq\037             - toggles multi-queue mode (1 queue per bot)",
]
cmd_help['msg'] = "   " + "   ".join(gen_help)
cmd_help['?'] = """\n\002/xdccq\002 \037[help, ?]\037 <cmd>\n   \00303By itself, help/? prints out the available commands along withshort descriptions of each.  If you supply a command \002cmd\002, a longer help description of that command and its usage is given.\003"""
cmd_help['ls'] = """\n\002/xdccq\002 \037[ls, list]\037\n   \00303Lists the file gets currently in the queue.\00303"""
cmd_help['get'] = """\n\002/xdccq\002 \037get\037 [bot] [#, #-#, #-#%#]\n   \00303Adds commands to the local queue "/ctcp \037bot\037 xdcc send \037#\037".  A number ["7"], a number range ["1-5"], a range with step ["0-10%2"] (1, 3, 5, ...), or a comma separated list ["7, 8-11, 15, 16-25%3"] may be given.\003"""
cmd_help['rm'] = """\n\003/xdccq\002 \037rm\037 [bot] <#, #-#>\n   \00303Removes commands from local queue.  If only \037bot\037 is supplied, it removes all commands dealing with \037bot\037.  If it is supplied with a number or number range, any commands in that range are removed.   If you had numbers "8, 9, 11, 12, 14" queued, and removed "8-14", it would remove all of those package numbers for that bot without resulting in an error for the missing "10" and "13".\003\n   \00303New in 0.3: rm will now also call 'cancel' if the active transfer is from [bot] and the optional range argument was not given.\003"""
cmd_help['cancel'] = """\n\003/xdccq\002 \037cancel\037\n   \00303If a DCC handled by xdccq is currently active, it cancels that transfer and starts the next one on the queue.  If the 'active' transfer is remotely queued, xdccq attempts to unqueue it by issuing a '/msg <bot> xdcc remove' command.  If this command fails, this transfer will continue to remotely pend; take notice!  In multiq mode, this cancels \037all\037 transfering packs.\003"""
cmd_help['multiq'] = """\n\003/xdccq\002 \037multiq\037\n   \00303The default mode for xdccq is to operate with one global queue and dish out 1 pack request at a time.  This toggles 'Multi-queue' mode, which keeps track of 1 transfer per bot in the queue.\003"""

def numToList(string):
    """Converts a string like '3,5,7-9,14' into a list."""
    ret = []
    numsplit = string.split(",")
    # the following code makes nums into a list of all integers
    for n in numsplit:
        nr = n.split('-')
        # handle the case of a single number
        if len(nr) == 1:
            try: ret.append(int(n))
            except: raise ValueError("number")
        # handle the case of a range
        elif len(nr) == 2:
            try:
                low = int(nr[0])
                nx = nr[1].split("%", 1)
                if len(nx) == 1:
                    high = int(nr[1]) + 1
                    step = 1
                else:
                    high = int(nx[0]) + 1
                    step = int(nx[1])
                if low > high: raise ValueError("number")
                ret += range(low, high, step)
            except ValueError: raise ValueError("number")
        else: raise ValueError("range")
    return ret

class Command:
    def __init__(self, bot, num):
        self.bot = str(bot)
        self.num = int(num)
        self.channel = xchat.get_info("channel")
        self.network = xchat.get_info("network")
        self.context = xchat.get_context()
        self.file = ""
        self.retries = 0
        self.queue_position = 0
        self.queued = False
        self.transfering = False
        self.dead = False
        self.s = "ctcp %s xdcc send #%d" % (str(bot), int(num))

    def __str__(self):
        return "#%d on %s (%s)" % (self.num, self.bot, self.channel)

    def execute(self, retry=False):
        if retry: self.retries += 1
        self.context.command(self.s)

    def retry(self):
        if self.retries < 3:
            self.execute(True)
            return True
        return False

    def dccclose(self):
        if self.transfering:
            s = "dcc close get %s %s" % (self.bot, self.file)
            print_debug("/%s" % (s))
            self.context.command(s)

    def dequeue(self):
        if self.queued:
            s = "msg %s xdcc remove" % (self.bot)
            print_debug("/%s" % (s))
            self.context.command(s)

class Queue:
    def __init__(self):
        self.data = []

    def put(self, item):
        self.data.append(item)

    def get(self):
        tmp = self.data[0]
        del self.data[0]
        return tmp

    def __getitem__(self, key):
        return self.data[key]

    def __delitem__(self, key):
        del self.data[key]

    def __len__(self):
        return len(self.data)

    def __iter__(self):
        return self.data.__iter__()

    def remove(self, item):
        self.data.remove(item)

    def append(self, item):
        self.data.append(item)

class cmdQueue(Queue):
    """Utility functions for dealing with a queue of Commands"""

    def getBotSet(self):
        """Returns a list of bots with packages in the queue."""
        return list(set([cmd.bot.lower() for cmd in self.data]))

    def getBotPackSet(self, botname, r=[]):
        """Gets the pack set in the Queue for a bot."""
        packs = [cmd for cmd in self.data if cmd.bot.lower() == botname.lower()]
        # if supplied a range, cut list to those in the range
        if r: packs = [cmd for cmd in packs if cmd.num in r]
        return packs

    def removeBot(self, botname, r=[]):
        """Remove the packs from bot `botname` with numbers in `r`."""
        packs = self.getBotPackSet(botname, r)
        for cmd in packs:
            self.data.remove(cmd)
        # this might be better as the actual list someday?
        return len(packs)

    def transfering(self):
        """Return the actively transfering commands."""
        return [cmd for cmd in self.data if cmd.transfering]

    def queued(self):
        """Return the queued commands."""
        return [cmd for cmd in self.data if cmd.queued]

    def cancel(self, bot, r=[]):
        items = self.getBotPackSet(bot, r)
        for item in items:
            item.dccclose()
            item.dequeue()
            self.remove(item)
        return items

class Irc(object):
    """Separation of logic from xchat internals."""
    @staticmethod
    def getCurrentBotCPS(bot):
        dcclist = xchat.get_list('dcc')
        cps = 'Unknown CPS'
        for item in dcclist:
            if str(item.nick).lower() == bot.lower():
                cps = '%s CPS' % (str(item.cps))
                break
        return cps

CommandQueue = cmdQueue()
# NOTE: In an old version, `Active` was the active command or `False`.  Now,
# it's a list to allow for multiq mode.  If multiq mode is OFF, then this will
# only ever have one command
Active = cmdQueue()
Watchdog = False
# set to True to enable multiq mode by default
MULTIQUEUE = False

# help, ?  -- print out explanations of commands
def help(a):
    if not len(a) == 3:
        usage(True)
        return
    msg = cmd_help.get(a[2], None)
    if msg:
        print_help(msg)

# ls, list -- print out a list of files in the queue
def ls(a):
    global CommandQueue, Active
    s = []
    for cmd in Active.transfering():
        cps = Irc.getCurrentBotCPS(cmd.bot)
        s.append("Pack #%d from %s on %s@%s being transfered at %s." % (cmd.num, cmd.bot, cmd.channel, cmd.network, cps))
    for cmd in Active.queued():
        s.append("Pack #%d from %s on %s@%s queued remotely [position %d]." % (cmd.num, cmd.bot, cmd.channel, cmd.network, cmd.queue_position))
    if len(CommandQueue) == 0:
        print_info("No files in the queue.  " + s)
    else:
        if not s:
            print_info("No files being transfered.")
        else:
            for line in s: print_info(line)
        for f in CommandQueue:
            print_info(f)

# get -- add commands to the queue
def get(a):
    if len(a) != 4:
        print_error("Error: invalid arguments for get.  /xdccq get [bot] [#, #-#]")
        return
    bot = str(a[2])
    try: nums = numToList(a[3])
    except ValueError, exc:
        # exc.args[0] is in the set ['number', 'range']
        print_error("Error: %s contains invalid %s." % (a[3], exc.args[0]))
        return
    print_info("adding packs for bot [%s]: %s" % (bot, str(nums)))
    for num in nums:
        CommandQueue.put(Command(bot, num))
    # if we actually added something, try to start this party
    if len(nums):
        run()

# rm -- remove commands from the queue  
def rm(a):
    global CommandQueue, Active
    if len(a) not in (3, 4):
        print_error("Error: invalid arguments for 'rm'.  /xdccq rm [bot] <#, #-#>")
        return
    items_to_delete = []
    if len(a) == 4:
        try: items_to_delete = numToList(a[3])
        except ValueError, exc:
            # exc.args[0] is in the set ['number', 'range']
            print_error("Error: %s contains invalid %s." % (a[3], exc.args[0]))
            return
    # if we removed all from bot, and the bot is currently transfering...
    removed = CommandQueue.removeBot(a[2], items_to_delete)
    active_removed = Active.cancel(a[2], items_to_delete)
    info = 'deleted %d commands from the wait queue.' % removed
    if active_removed:
        info = info[:-1] + ', and %d from the active.' % len(active_removed)
    print_info(info)

# we won't be needing a, and it'l clean the call elsewhere
def cancel(a=[]):
    global Active
    if not Active:
        print_error("No currently transfering packages.")
        return
    for item in Active.transfering():
        item.dccclose()
        Active.remove(item)
    for item in Active.queued():
        item.dequeue()
        Active.remove(item)
    run()

def multiq(a=[]):
    global MULTIQUEUE
    MULTIQUEUE = not MULTIQUEUE
    if MULTIQUEUE: s = 'on'
    else: s = 'off'
    print_info("Multiq mode %s" % s)

USAGE_STR = "Usage: \002/xdccq\002 [cmd] [args], \002/xdccq\002 \037help\037 for commands."

def usage(verbose=False):
    """Prints a usage message, and extra help if requested."""
    print USAGE_STR
    if verbose: print cmd_help['msg']

def dispatch(argv, arg_to_eol, c):
    print_debug(argv)
    echo("/" + str(arg_to_eol[0]))
    try:
        {
        "help"    : help,
        "?"       : help,
        "ls"      : ls,
        "list"    : ls,
        "get"     : get,
        "rm"      : rm,
        "cancel"  : cancel,
        "stop"    : cancel,
        "multiq"  : multiq,
    }[argv[1]](argv)
    except:
        if __debugging__: traceback.print_exc(sys.stdout)
        usage()
    return xchat.EAT_XCHAT

# watchdog callback
def transferCheck(data):
    """This watchdog function runs as long as we are transferring something.  It
    goes through the active queue looking for packs that are neither transferring
    nor queued.  If it finds one as such, it marks it as 'dead'.  If it stays 'dead'
    until the next run, it will retry the request.  If the retry threshold (3) is
    met, the command will be removed."""
    global Active
    # if active has already finished, stop the timer
    if not Active:
        return False
    for cmd in Active:
        if cmd.transfering or cmd.queued:
            continue
        if not cmd.dead:
            cmd.dead = True
        elif cmd.retry():
            print_error("Previous attempt to get file (#%d from %s) failed.  Repeating (%d of 3 retries)" % (cmd.num, cmd.bot, cmd.retries))
        else:
            print_info("At this point we'd want to remove (#%d from %s, %d)." % (cmd.num, cmd.bot, cmd.retries))
            # run()
    return True

def run():
    """This is the logic on what packs actually get added to the queue.  It's
    run just about any time there is an interaction with the queue (get, delete,
    dcc events, etc)."""
    global CommandQueue, Active, Watchdog
    if not MULTIQUEUE:
        # If there's an active transfer, we return
        if Active: return
        if not CommandQueue: return
        # If not, we start one and start a watchdog timer
        cmd = CommandQueue.get()
        Active.append(cmd)
        cmd.execute()
        if not Watchdog:
            Watchdog = xchat.hook_timer(45000, transferCheck)
        return
    # We are in MULTIQUEUE mode ...
    aps = sorted(Active.getBotSet())
    cps = sorted(CommandQueue.getBotSet())
    missing = [bot for bot in cps if bot not in aps]
    print_debug('multiq: a: %s, q: %s, missing: %s' % (aps, cps, missing))
    # if we have the same bots in each, we are already transfering at full..
    if not missing:
        return
    for bot in missing:
        cmd = CommandQueue.getBotPackSet(bot)
        if not cmd: return
        cmd = cmd[0]
        Active.append(cmd)
        CommandQueue.remove(cmd)
        print_debug("/%s on %s@%s" % (cmd.s, cmd.channel, cmd.network))
        cmd.execute()
    # set up a watchdog every 45 seconds
    if Active and not Watchdog:
        Watchdog = xchat.hook_timer(45000, transferCheck)

""" some other messages are possible:
** Closing Connection: Unable to transfer data (Broken pipe)
** Closing Connection: DCC Timeout (180 Sec Timeout)
"""
def notice(split, full, data):
    global CommandQueue, Active
    # ['jonas|srvr', 'Total Offered: 0.3 MB  Total Transferred: 0.30 MB']
    botname = split[0]
    message = split[1]
    for cmd in Active:
        re_pos = re.compile(r"position [0-9]+")
        if 'queue' in message.lower():
            cmd.queued = True
            print_info("xdccq detected the active file being placed on a remote queue")
        res = re_pos.search(message.lower())
        if res:
            try:
                postr = message[res.start() : res.end()]
                pos = int(postr.split()[1])
                cmd.queue_position = pos
            except:
                cmd.queue_position = 0
                print_error("an error occured parsing the remote queue position")

def dccComplete(split, full, data):
    # ['just4u.txt', '/home/jmoiron/.xchat2/downloads/just4u.txt.1', 'just|4|u', '38373']
    if not Active: return
    #print_debug(str(split))
    for cmd in Active.transfering():
        if cmd.bot == str(split[2]):
            # we assume it was our file
            print_info("Received file \"%s\" from %s on %s@%s." % (cmd.file, cmd.bot, cmd.channel, cmd.network))
            Active.remove(cmd)
    run()

def dccConnect(split, full, data):
    global CommandQueue, Active
    if not Active: return
    #print_debug(str(split))
    botname = str(split[0])
    for cmd in (c for c in Active if c.bot == botname):
        print_info("Requested file \"%s\" is being sent." % (split[2]))
        cmd.file = split[2]
        cmd.queued = False
        cmd.transfering = True

def dccStall(split, full, data):
    global CommandQueue, Active
    botname = str(split[2])
    for cmd in (c for c in Active if c.bot == botname):
        print_error("Requested file \"%s\" has stalled during transport." % (split[1]))
        ret = cmd.retry()
        if ret:
            print_info("Re-requesting file \"%s\" (%d of 3 retries)" % (split[1], Active.retries))
        else:
            print_error("Retry limit reached for file \"%s\".  Stopping the queue." % (split[1]))

__unhook__ = xchat.hook_command("xdccq", dispatch, help=USAGE_STR)

print_info("XdccQ-TNG loaded successfully")
usage()

noticeHook = xchat.hook_print("Notice", notice, "data")
dccRecvCompleteHook = xchat.hook_print("DCC RECV Complete", dccComplete, "data")
dccRecvConnectHook = xchat.hook_print("DCC RECV Connect", dccConnect, "data")
dccRecvStallHook = xchat.hook_print("DCC Stall", dccStall, "data")

if __name__ == "__main__":
    def tests():
        """
        >>> numToList("1")
        [1]
        >>> numToList("1,2,4")
        [1, 2, 4]
        >>> numToList("1-4")
        [1, 2, 3, 4]
        >>> numToList("1-4,8,12")
        [1, 2, 3, 4, 8, 12]
        >>> numToList("1-4,8,12-48%4,50")
        [1, 2, 3, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 50]
        """
        pass
    import doctest
    doctest.testmod()
