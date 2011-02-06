#!/usr/bin/python
#
# avalon.py - an archlinux file list searcher
#
# Copyright (C) 2008  Jonathan Frazier
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

from __future__ import print_function # fancy new print function
import sqlite3 as sqlite 
import tarfile # extract file tarballs
import re # regexp helper
import sys # for exiting
import os

# user options 
repositories=("core", "extra", "community", "testing")
arch="i686"

# mirror: a line out of /etc/pacman.d/mirrorlist including $arch and $repo,
mirror="http://mirrors.easynews.com/linux/archlinux/$repo/os/$arch/"

filelistPath="/var/lib/avalon"
db_path="/var/lib/avalon/pacfiles.db"

# users shouldn't need to change these.
pkgnamePattern='(?P<name>.*)-(?P<ver>[0-9.A-z_]*-[0-9.]*)/files'
filelistExt=".files.tar.gz"
fetch_cmd="/usr/bin/wget"
fetch_arg="--passive-ftp -O"

def init_options():
    from optparse import OptionParser
    global options
    global args
    # --- options ---
    parser = OptionParser(version="%prog 0.2")
    parser.add_option("-r", "--regexp", action="store_true",
                      dest="regexpsearch",
                     help="Search for a file matching a regular expression")
    parser.add_option("-g", "--glob", action="store_true", dest="globsearch",
                      help="Search for a file using globs")
    parser.add_option("-s", "--search", action="store_true", dest="likesearch",
                help="Search for files containing a patttern (SQL like search)")
    parser.add_option("-l", "--list", action="store_true", dest="list", 
                      help="List the files owned by a package")
    parser.add_option("-o", "--repo", dest="repo", 
                      help="Limit search to a specific repository")
    parser.add_option("-u", "--updatedb", action="store_true", dest="updatedb", 
                      help="Fetch new filelists and build the database")
    parser.add_option("-U", "--update-nodownload", action="store_true",
                      dest="no_download", 
                      help="Build the database existing file lists.")
    #parser.add_option("-d", "--show_dir", action="store_true", dest="showdir", 
    #  help="include directories in results", default=False)

    (options, args) = parser.parse_args()

    # --- interpret arguments ---
    # can only use one of these at a time.
    if options.regexpsearch and options.globsearch:
        parser.error("Options -r, -g, and -s cannot be used at the same time")
    if len(args) != 1 and not (options.updatedb or options.no_download):
        parser.error("Missing search pattern")

# _-- db layout --_ 
#
# package table
#   id
#   name
#   version
#   mtime
#   repo
#
# file table
#   package id
#   full path
#
# -__           __-

# this allows a (slow) regexp functionality for sqlite
# Returns 1 if `item` matches the regular expression `expr`, 0 otherwise
def _regexp(expr, item):
    # print (expr,item)
    # print('\x08.', end='', sep='')
    _r = re.compile(expr)
    return _r.match(item) is not None

def connect_db():
    global db
    global sqlc
    #check if we have permission to write the db or it is :memory:.
    if db_path != ":memory:":
        # get the directory path and test if we can write in it
        db_dir=os.path.split(db_path)[0]
        if not os.access(db_dir, os.W_OK or os.X_OK):
            print ("Error: Unable to access the path to the database file:", db_path)
            return False

    # db = sqlite.connect(":memory:")
    db = sqlite.connect(db_path)
    db.create_function("regexp", 2, _regexp)
    sqlc = db.cursor()

def create_db():
    sqlc.execute('''create table packages(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, packagename text, version text, modifiedtime timestamp, repository text)''')
    sqlc.execute('''create table files(packageid number, path text)''')
    # create a view for easy formatting of package lists
    # sqlc.execute('''CREATE VIEW listfilesview AS SELECT packagename,path from files join packages ON (packages.id=files.packageid)''')

def drop_db():
    sqlc.execute('''drop view listfilesview''')
    sqlc.execute('''drop table packages,files''')


# Add a file list tarball to the db
# TODO check for duplicate packages.
# TODO see if combining inserts will save time.
# TODO catch errors if the tarball is really a html page
def add_repo_file(repo, repofile):
    #packagename files...
    pkgname = ""
    version = ""
    i=0

    # open the archlinux file list tarball
    tar = tarfile.open(repofile, "r:gz")
    verregexp = re.compile(pkgnamePattern)

    #scan each directory contained in the tarball
    for tarinfo in tar:
        #DEBUG: print tarinfo.name, "is", tarinfo.size, "bytes in size and is"
        if tarinfo.isreg():
            #use directory name to find package name and version
            match = verregexp.match(tarinfo.name)
            if match != None:
                pkgname = match.group('name')
                version = match.group('ver')
            else:
                print("failed to find package name and version from:", tarinfo.name)

            # add package info into the package table.
            p = (pkgname, version, tarinfo.mtime, repo)
            # entertain our users with happy dots
            i+=1
            if i % 25 == 0:
                print('.', sep='', end='')
                sys.stdout.flush()
            sqlc.execute("insert into packages (packagename, version, modifiedtime, repository) values ( ?, ?, ?, ?)", p)
            pid = sqlc.lastrowid
            if pid == "none":
                print("Error: failed to insert packages into db: no package id returned")
            # extract file and add the contents to the file table
            fb = tar.extractfile(tarinfo.name)
            fb.readline() # skip the first item "%FILES%"
            for line in fb.readlines():
                f = (pid, line.strip())
                sqlc.execute("insert into files values (?,?)", f)
    print("ok")
    tar.close()
    db.commit()

# search the db for files matching a given regular expression
def _find_files_regexp(pattern):
    # print("searching..")
    sqlarg=pattern.encode('utf8')
    sqlcmd='''SELECT repository,packagename,path from files 
            join packages ON (packages.id=files.packageid)'''
    # search just the given repo
    if options.repo:
        sqlcmd += '''where repository="''' + options.repo + '''" AND regexp (?, "path")'''
    # search all repos
    else:
        sqlcmd += '''where regexp (?, "path")'''
    sqlc.execute(sqlcmd , (sqlarg, ))
    format_print(sqlc.fetchall())


# search the db for files matching a SQL glob pattern
def find_files_glob(pattern):
    sqlarg=(pattern,)
    sqlcmd='''SELECT repository,packagename,path from files 
                join packages ON (packages.id=files.packageid) '''
    if options.repo:
        sqlcmd += '''where repository="''' + options.repo + '''" AND path GLOB (?)'''
    else:
        sqlcmd += '''where path GLOB (?)'''
    sqlc.execute(sqlcmd, sqlarg)
    format_print(sqlc.fetchall())

# search the db for files matching a SQL "like" pattern
def find_files_like(pattern):
    # if pattern doesn't have a %, match if pattern is found anywhere
    if pattern.find('%') == -1:
        pattern = '%' + pattern + '%'
    sqlarg=(pattern,)
    sqlcmd='''SELECT repository,packagename,path from files 
            join packages ON (packages.id=files.packageid) '''
    if options.repo:
        sqlcmd += '''where repository="''' + options.repo + '''" AND path LIKE (?)'''
    else:
        sqlcmd += '''where path LIKE (?)'''
    sqlc.execute(sqlcmd, sqlarg)
    format_print(sqlc.fetchall())


def clear_db():
    try:
        #TODO combine these
        sqlc.execute('''drop table packages''')
        sqlc.execute('''drop table files''')
    except:
        print("Unable to drop tables, continuing")
        pass

# fetch new copies of the file lists
# TODO check path exists and is writable
def download_files():
    from subprocess import call

    for repo in repositories:
        # build paths
        filename= repo + filelistExt
        #print (filename)
        #replace $repo in mirror with our repo if it exists
        fetch_path=re.sub(r'\$repo', repo, mirror)
        #replace $arch in mirror with our arch if it exists
        fetch_path=re.sub(r'\$arch', arch, fetch_path)
        dest_path=filelistPath + '/' + filename
        _fetch_arg = fetch_arg + " " + dest_path + " " + fetch_path + filename
        #print (fetch_cmd, _fetch_arg, sep="...")
        # fetch files
        try:
            retcode = call(fetch_cmd + " " +  _fetch_arg, shell=True)
            if retcode < 0:
                print ("wget was terminated by signal", retcode)
            elif retcode > 0:
                print ("wget exited with signal", retcode)
                sys.exit("1")
            #else:
                #print ("wget returned unknown code:", retcode)
        except OSError, e:
            print ("Execution failed:", e)

# Fill table from the db files
def update_db():
    clear_db()
    create_db()
    for repo in repositories:
        filename=filelistPath + "/" + repo + filelistExt
        if os.access(filename, os.R_OK):
            print("Adding file", filename, "to database")
            add_repo_file(repo, filename)
        else:
             print("Error: Unable to read file:", filename)

# list all files of a given package name
def list_files(pattern):
    sqlarg=(pattern,)
    sqlcmd='''SELECT repository,packagename,path from files 
            join packages ON (packages.id=files.packageid) '''
    if options.repo:
        sqlcmd += '''where repository="''' + options.repo + '''" AND packagename=(?)'''
    else:
        sqlcmd += '''where packagename=(?)'''
    # print(sqlcmd, sqlarg)
    sqlc.execute(sqlcmd, sqlarg)
    format_print(sqlc.fetchall())

# wrapper to print list arrays [(),()] nicely
def format_print(arg):
    for i in range(len(arg)):
        print (*arg[i] , sep=' ')

# commit any db changes and close it
def leave():
    db.commit()
    db.close()

def dump_db(table):
    sqlarg="select * from " + table
    sqlc.execute(sqlarg)
    found = sqlc.fetchall()
    return found

# main routine
# TODO: return results here to print
def main():
    init_options()
    if False == connect_db():
        exit(False)
        
    if options.no_download:
        update_db()
    elif options.updatedb:
        download_files()
        update_db()

    if options.regexpsearch:
        _find_files_regexp(args[0])
    elif options.list:
        list_files(args[0])
    elif options.globsearch:
        find_files_glob(args[0])
    elif options.likesearch:
        find_files_like(args[0])
    leave()

if __name__ == '__main__': main()
