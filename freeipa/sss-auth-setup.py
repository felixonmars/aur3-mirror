#!/usr/bin/env python3

# Written by: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# License: GPLv3

import datetime
import hashlib
import os
import re
import shutil

nss_databases = ['passwd', 'group', 'services', 'netgroup', 'automount']

def nss_enable_sss():
  if os.path.exists("/etc/nsswitch.conf.sss_tmp"):
    os.remove("/etc/nsswitch.conf.sss_tmp")

  # Backup /etc/nsswitch.conf
  shutil.copyfile("/etc/nsswitch.conf", "/etc/nsswitch.conf.sss_bak")

  nsswitch_orig = open("/etc/nsswitch.conf", 'r')
  nsswitch_new = open("/etc/nsswitch.conf.sss_tmp", 'w')

  while True:
    current_line = nsswitch_orig.readline()
    if not current_line:
      break

    if current_line != '\n' and current_line.split()[0][:-1] in nss_databases:
      if "sss" in current_line:
        print("sss is already enabled for the NSS " +
              current_line.split()[0][:-1] + " database")
      else:
        print("Enabling sss support for the NSS " +
              current_line.split()[0][:-1] + " database...")
        if current_line[-1] == '\n':
          current_line = current_line[:-1] + " sss\n"
        else:
          current_line += " sss"

    # Write new file
    nsswitch_new.write(current_line)

  nsswitch_orig.close()
  nsswitch_new.close()

  # Replace original /etc/nsswitch.conf
  shutil.move("/etc/nsswitch.conf.sss_tmp", "/etc/nsswitch.conf")

def nss_disable_sss():
  if os.path.exists("/etc/nsswitch.conf.sss_tmp"):
    os.remove("/etc/nsswitch.conf.sss_tmp")

  nsswitch_orig = open("/etc/nsswitch.conf", 'r')
  nsswitch_new = open("/etc/nsswitch.conf.sss_tmp", 'w')

  while True:
    current_line = nsswitch_orig.readline()
    if not current_line:
      break

    if current_line != '\n' and current_line.split()[0][:-1] in nss_databases:
      if "sss" in current_line:
        print("Disabling sss for the NSS " +
              current_line.split()[0][:-1] + " database...")
        current_line = re.sub(r"[ \t]+sss[ \t]*", ' ', current_line)
        # Remove extra spaces
        current_line = re.sub(r"[ \t]+\n", '\n', current_line)

    # Write new file
    nsswitch_new.write(current_line)

  nsswitch_orig.close()
  nsswitch_new.close()

  # Replace original /etc/nsswitch.conf
  shutil.move("/etc/nsswitch.conf.sss_tmp", "/etc/nsswitch.conf")

def pam_hash_write(pam_config):
  pam_hashes = open("/etc/sssd/pam.hashes", 'a')
  pam_file = open("/etc/pam.d/" + pam_config, 'rb')

  sha512sum = hashlib.sha512(pam_file.read()).hexdigest()

  pam_file.close()

  pam_hashes.write(pam_config + ' ' + sha512sum + '\n')

  pam_hashes.close()

def pam_hash_read(pam_config):
  pam_hashes = open("/etc/sssd/pam.hashes", 'r')

  while True:
    current_line = pam_hashes.readline()
    if not current_line:
      break

    if current_line.split()[0] == pam_config:
      pam_hashes.close()
      return current_line.split()[1]

  pam_hashes.close()
  return ""

def pam_hash_remove(pam_config):
  pam_hashes_orig = open("/etc/sssd/pam.hashes", 'r')
  pam_hashes_new = open("/etc/sssd/pam.hashes.tmp", 'w')
  remaining_lines = 0

  while True:
    current_line = pam_hashes_orig.readline()
    if not current_line:
      break;

    if current_line.split()[0] == pam_config:
      continue

    remaining_lines += 1
    pam_hashes_new.write(current_line)

  pam_hashes_orig.close()
  pam_hashes_new.close()

  os.remove("/etc/sssd/pam.hashes")
  shutil.move("/etc/sssd/pam.hashes.tmp", "/etc/sssd/pam.hashes")

  if remaining_lines == 0:
    os.remove("/etc/sssd/pam.hashes")

def pam_config_setup(pam_config):
  pam_file_orig = open("/etc/pam.d/" + pam_config, 'r')
  pam_file_new = open("/etc/sssd/" + pam_config + ".tmp", 'w')

  while True:
    current_line = pam_file_orig.readline()
    if not current_line:
      break

    if current_line != '\n' and current_line[0] != '#':
      current_line_split = current_line.split()

      # Change 'required' to 'sufficient' for the pam_unix.so module
      if current_line_split[2] == "pam_unix.so" and current_line_split[1] == "required":
        pam_file_new.write(current_line.replace("required", "sufficient"))
        pam_file_new.write(current_line_split[0] + "\t\tinclude\t\tsss\n")
        continue

    pam_file_new.write(current_line)

  pam_file_orig.close()
  pam_file_new.close()

  os.remove("/etc/pam.d/" + pam_config)
  shutil.move("/etc/sssd/" + pam_config + ".tmp", "/etc/pam.d/" + pam_config)

def pam_enable_sss():
  if os.path.exists("/etc/sssd/pam.hashes"):
    print("PAM is already set up!")
    exit(1)

  # Backup the backups
  if os.path.exists("/etc/sssd/pam.backup/"):
    current_datetime = str(datetime.datetime.now()).replace(' ', '_')
    print("/etc/sssd/pam.backup/ already exists. Moving to /etc/sssd/pam.backup." + current_datetime + "/")
    shutil.move("/etc/sssd/pam.backup/", "/etc/sssd/pam.backup." + current_datetime)

  if not os.path.exists("/etc/sssd/pam.backup/"):
    print("Creating backup directory /etc/sssd/pam.backup/ for the original PAM files...")
    os.mkdir("/etc/sssd/pam.backup/")

  if os.path.isfile("/etc/sssd/pam.backup/"):
    print("/etc/sssd/pam.backup is a file!")
    exit(1)

  print("Backing up:")

  for fullpath, directories, files in os.walk("/etc/pam.d/"):
    for pam_config in files:
      print("  /etc/pam.d/" + pam_config)
      shutil.copyfile("/etc/pam.d/" + pam_config,
                      "/etc/sssd/pam.backup/" + pam_config)

      pam_config_setup(pam_config)

      # Save the hashes of the altered files. When disabling PAM support for
      # sss, changed files won't be restored (updates, user changes, etc).
      pam_hash_write(pam_config)

  if os.path.exists("/etc/pam.d/sss"):
    print("/etc/pam.d/sss already exists. Moving it to /etc/pam.d/sss.bak")
    shutil.move("/etc/pam.d/sss", "/etc/pam.d/sss.bak")

  pam_sss = open("/etc/pam.d/sss", 'w')
  pam_sss.write("auth     sufficient pam_sss.so\n")
  pam_sss.write("account  [default=bad success=ok user_unknown=ignore] pam_sss.so\n")
  pam_sss.write("password sufficient pam_sss.so use_authtok\n")
  pam_sss.write("session  optional   pam_sss.so\n")
  pam_sss.close()

def pam_disable_sss():
  if not os.path.exists("/etc/sssd/pam.hashes"):
    print("PAM hasn't been set up yet!")
    exit(1)

  if os.path.exists("/etc/pam.d/sss"):
    os.remove("/etc/pam.d/sss")

  print("Restoring:")

  for fullpath, directories, files in os.walk("/etc/pam.d/"):
    for pam_config in files:
      
      pam_file = open("/etc/pam.d/" + pam_config, 'rb')
      sha512sum = hashlib.sha512(pam_file.read()).hexdigest()
      pam_file.close()
      sha512sum_bak = pam_hash_read(pam_config)

      if sha512sum_bak == "":
        print("  Not restoring /etc/pam.d/" + pam_config)
        print("    File was never set up for sss")
        continue

      if sha512sum != sha512sum_bak:
        print("  Not restoring /etc/pam.d/" + pam_config)
        print("    File has been altered")
        continue

      print("  /etc/pam.d/" + pam_config)
      shutil.copyfile("/etc/sssd/pam.backup/" + pam_config,
                      "/etc/pam.d/" + pam_config)

      pam_hash_remove(pam_config)
      os.remove("/etc/sssd/pam.backup/" + pam_config)

  try:
    os.rmdir("/etc/sssd/pam.backup/")
  except OSError as ex:
    print("Files not restored:")
    for fullpath, directories, files in os.walk("/etc/sssd/pam.backup/"):
      for pam_config in files:
        print("  /etc/sssd/pam.backup/" + pam_config)

def parse_arguments():
  import argparse
  import textwrap

  arg_parser = argparse.ArgumentParser()
  arg_parser.formatter_class = argparse.RawDescriptionHelpFormatter
  arg_parser.description = textwrap.dedent("""
  Arch Linux sssd authentication setup helper for PAM and NSS
  -----------------------------------------------------------
  """)

  nss_group = arg_parser.add_mutually_exclusive_group()
  nss_group.add_argument("--enable-nss",
                         help="Enable support for SSSD in NSS",
                         action="store_true",
                         dest="nss_action",
                         default=None)
  nss_group.add_argument("--disable-nss",
                         help="Disable support for SSSD in NSS",
                         action="store_false",
                         dest="nss_action",
                         default=None)

  pam_group = arg_parser.add_mutually_exclusive_group()
  pam_group.add_argument("--enable-pam",
                         help="Enable support for SSSD in PAM",
                         action="store_true",
                         dest="pam_action",
                         default=None)
  pam_group.add_argument("--disable-pam",
                         help="Disable support for SSSD in PAM",
                         action="store_false",
                         dest="pam_action",
                         default=None)

  args = arg_parser.parse_args()

  if args.nss_action == None and args.pam_action == None:
    print("No action given!")
    exit(1)

  if os.getuid() != 0:
    print("sss-auth-setup must be run as root!")
    exit(1)

  if args.nss_action != None:
    if args.nss_action:
      nss_enable_sss()
    else:
      nss_disable_sss()

  if args.pam_action != None:
    if args.pam_action:
      pam_enable_sss()
    else:
      pam_disable_sss()

if __name__ == "__main__":
  parse_arguments()
