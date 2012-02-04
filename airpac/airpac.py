# -*- coding: utf-8 -*-
# airpac - aria2c wrapper for pacman
# Copyright (C) 2009  Darwin M. Bautista
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import os
import sys
import shutil
import signal
import asyncore
from tempfile import NamedTemporaryFile
from subprocess import Popen, PIPE


BIN = '/usr/bin/aria2c'
CONF = '/etc/airpac.conf'
STATS = '/var/lib/airpac.stats'
DIR = '/var/lib/pacman/.airpac'
PACDIR = '/var/lib/pacman'

# Obtained from /etc/rc.d/functions
C_MAIN = '\033[1;37;40m'      # main text
C_OTHER = '\033[1;34;40m'     # prefix & brackets
C_BUSY = '\033[0;36;40m'      # busy
C_FAIL = '\033[1;31;40m'      # failed
C_DONE = '\033[1;37;40m'      # completed
C_CLEAR = '\033[1;0m'


def log(width, label, msg, cr=True):
    spaces = ' ' * (width - len(label) - len(msg) - 4)
    if msg == 'DONE':
        status = C_DONE
    elif msg == 'FAIL':
        status = C_FAIL
    else:
        status = C_BUSY
    print ' %s%s%s%s%s[%s%s%s]%s' % (C_MAIN, label, C_CLEAR, spaces, C_OTHER, status, msg, C_OTHER, C_CLEAR),
    if cr:
        print '\r',
    sys.stdout.flush()


def gen_input_file(uri):
    uris = [uri]
    max_mirrors = 2
    if not uri.endswith('.db.tar.gz'):
        with open(CONF, 'r') as conf:
            for line in conf:
                if line.lstrip().startswith('split'):
                    max_mirrors = 2 * int(line.split('=')[1].strip())
        fname = os.path.basename(uri)
        base_uri = os.path.dirname(uri)
        repo = '[' + uri.split('/')[-4] + ']'
        last_repo = None
        found_repo = False
        with open('/etc/pacman.conf', 'r') as conf:
            for line in conf:
                line = line.strip()
                path = line.split('=')[-1].lstrip()
                if line.startswith('['):
                    found_repo = (line == repo)
                    if not found_repo:
                        last_repo = line
                    else:
                        repo = repo.strip('[]')
                        uris = []
                elif found_repo:
                    if line.startswith('Server'):
                        uris.append('%s/%s\t' % (path, fname))
                    elif line.startswith('Include'):
                        with open(path, 'r') as f:
                            for line in f:
                                line = line.strip()
                                if line.startswith('Server'):
                                    path = line.split('=')[-1].lstrip().replace('$repo', repo)
                                    uris.append('%s/%s\t' % (path, fname))
                                if len(uris) >= max_mirrors:
                                    break
                    if len(uris) >= max_mirrors:
                        break
                elif not found_repo:
                    if base_uri in path and last_repo is not None:
                        repo = last_repo
                        found_repo = True
                        uris.append('\t')
    with NamedTemporaryFile(mode='w', prefix='airpac-', delete=False) as tmp:
        tmp.writelines(uris)
    # Force 2 connections per server if the number of mirrors is less than the value of 'split'
    mirrors = len(''.join(uris).split())
    split = max_mirrors / 2
    if mirrors < split / 2:
        split = 2 * mirrors
    return tmp.name, str(split)


def db_cache(fname, store=False):
    if not os.path.isdir(DIR):
        os.mkdir(DIR)
    if store:
        src = PACDIR
        dst = DIR
    else:
        src = DIR
        dst = PACDIR
    src += '/' + fname
    try:
        shutil.copy2(src, dst)
    except IOError:
        pass


def main():
    if not os.access(BIN, os.X_OK):
        sys.exit('aria2c not found_repo')
    try:
        uri, outfile = sys.argv[1:]
    except ValueError:
        sys.exit('incorrect number of arguments')

    outdir = os.path.dirname(outfile)
    outfile = os.path.basename(outfile)
    tempfile = outfile + '.airpac'
    infile, num = gen_input_file(uri)

    args = [
        BIN, '--conf-path=' + CONF, '--remote-time=true', '--continue',
        '--allow-overwrite=true', '--summary-interval=0', '--split=' + num,
        '--server-stat-if=' + STATS, '--server-stat-of=' + STATS,
        '--dir=' + outdir, '--out=' + tempfile, '--input-file=' + infile
    ]

    if uri.endswith('.db.tar.gz'):
        db_cache(tempfile)

    aria2c = Popen(args, stdout=PIPE)

    def terminate(signum=None, frame=None, failed=False):
        asyncore.socket_map.clear()
        aria2c.wait()
        os.unlink(infile)
        if signum is not None:
            print '\n'
            sys.stdout.flush()
        if signum is not None or failed:
            sys.exit(1)

    signal.signal(signal.SIGINT, terminate)
    signal.signal(signal.SIGTERM, terminate)

    # An easy way of getting the terminal width
    width = int(Popen(['stty', 'size'], stdout=PIPE).communicate()[0].split()[1])
    name = os.path.basename(uri).rsplit('.', 3)[0]

    def handle_read():
        data = aria2c.stdout.readline().strip()
        if data.startswith('[#1'):
            log(width, name, data.strip('[#1 ]'))
        elif data.startswith('(OK):'):
            log(width, name, 'DONE', cr=False)
            terminate()
        elif data.startswith('(ERR):'):
            log(width, name, 'FAIL', cr=False)
            terminate(failed=True)

    asyncore.file_dispatcher(aria2c.stdout).handle_read = handle_read
    asyncore.loop()

    if aria2c.returncode == 0:
        if uri.endswith('.db.tar.gz'):
            db_cache(tempfile, store=True)
        os.rename(tempfile, outfile)
