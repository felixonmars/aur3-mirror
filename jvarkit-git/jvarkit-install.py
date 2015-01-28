#!/usr/bin/env python3
import subprocess, sys, os, re
from collections import OrderedDict

jvarkit="/usr/share/jvarkit"
install_location="/usr/local/bin"

def print_tools(tools):
    """ Pretty print a list of running interactive jobs from create_queue """

    name_len = 10

    for k, v in tools.items():
        name_len = max([name_len, len(k)])
    name_len = name_len + 2

    tools = OrderedDict(sorted(tools.items()))

    # Print the thing
    for k, v in tools.items():
        print(k.ljust(name_len) + v)

def install_tool(tool):
    """ Install the tool """
    os.chdir(jvarkit)
    subprocess.check_call('JAVA_HOME=/usr/lib/jvm/java-7-openjdk ant ' + tool.lower(), shell=True)
    subprocess.check_call("perl -pi -e 's#java#/usr/lib/jvm/java-7-openjdk/jre/bin/java#' dist/" + tool.lower(), shell=True)
    subprocess.check_call("perl -pi -e 's#PREFIX=\$\(dirname \$0\)#PREFIX=/usr/share/java/jvarkit#' dist/" + tool.lower(), shell=True)
    subprocess.check_call('mv dist/' + tool.lower() + ' ' + install_location, shell=True)

def uninstall_tool(tool):
    """ Uninstall the tool """
    os.chdir(jvarkit)
    try:
        subprocess.check_call('rm dist/' + tool.lower() + '.jar', shell=True)
        subprocess.check_call('rm ' + install_location + '/' + tool.lower(), shell=True)
    except subprocess.CalledProcessError:
        print("Tool", tool, "appears to not be installed")
        return
    print("Uninstalled " + tool)

def get_table():
    """ Download tool table from web """
    file = open(jvarkit + '/README.md', 'r')
    table = {}
    for i in file:
        if i.startswith('<tr><th><a'):
            #t = re.findall(r'href="([^"]+)">([^<]+)', i)[0]
            t = re.findall(r'href="[^"]+">([^<]+)', i)[0]
            y = re.findall(r'>([^<]+)</td></tr>$', i)[0]
            table[t] = y
    return(table)

def _get_args():
    """Command Line Argument Parsing"""
    import argparse

    parser = argparse.ArgumentParser(
                 description=__doc__,
                 formatter_class=argparse.RawDescriptionHelpFormatter)

    # Tool
    parser.add_argument('tool_name', nargs='?', help="Tool to install or uninstall")

    # Flags
    parser.add_argument('-l', '--list',      action='store_true', help="List all tools")
    parser.add_argument('-i', '--install',   action='store_true', help="Install specified tool")
    parser.add_argument('-u', '--uninstall', action='store_true', help="Uninstall specified tool")

    return(parser)

# Main function for direct running
def main():
    """Run directly"""
    # Get commandline arguments
    parser = _get_args()
    args = parser.parse_args()

    tools = get_table()

    if args.list:
        print_tools(tools)
        sys.exit(0)

    if not args.tool_name:
        parser.print_help()
        sys.exit(1)

    if args.install:
        install_tool(args.tool_name)

    if args.uninstall:
        uninstall_tool(args.tool_name)

# The end
if __name__ == '__main__':
    main()
