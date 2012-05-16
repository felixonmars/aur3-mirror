pkgname=speed2fritz
pkgver=1475
pkgrel=1
pkgdesc="speed2fritz is a script collection for flashing Speedport-routers with a custom firmware"
url="http://www.ip-phone-forum.de/showthread.php?t=172137"
arch=('i686' 'x86_64')
license=("GPL2")
depends=('kdiff3' 'lynx' 'inetutils' 'wget')
makedepends=('svn' 'ncurses' 'automake')
options=('!strip')
build () {
  svn co https://freetzlinux.svn.sourceforge.net/svnroot/freetzlinux/trunk/speed-to-fritz speed-to-fritz
  cd $srcdir/speed-to-fritz

  export K_ONLY=1 # if set to 1 only build kconfig if set to 0 all tools are rebult first
  echo
  echo
  ! [ -f ./incl_var ] && touch ./incl_var
  ! grep -q 'REUSECONF="y"' ./incl_var && [ -f "./Firmware.conf" ] && rm -fr ./Firmware.conf &&\ 
  echo "You are starting with clean configuration, all settings made last time are removed!" &&\
    sleep 3

  if ! [ -f "./Firmware.conf" ]; then
    echo "#!/bin/bash" > ./Firmware.conf
    echo "# Automatically generated make config: don't edit" >> ./Firmware.conf
    chmod 755 "./Firmware.conf"

cat << 'EOF' > "./incl_var"
#!/bin/bash
export FIRST_RUN="y"
export VERBOSE=""
export OEM="avm"
export HWRevision="101.1.1.0"
export ETH_IF=""
export IPADDRESS="192.168.178.1"
export CONFIG_jffs2_size="32"
export ANNEX="B"
export avm_Lang="de"
export SKRIPT_DATE="00 --- ATTENTION, you are starting the setuptool for the first time! ---"
export AVM_VERSION="04.57"
export TCOM_VERSION="04.56"
export SPNUM="701"
export CLASS="Speedport"
export TCOM_SUBVERSION="0"
export AVM_SUBVERSION="0"
export firmwareconf_file_name="Firmware.conf"
EOF
chmod 755 "./incl_var"
  fi
  export HOMEDIR="`pwd`"
  # exract packed ./conf directory
  ! [ -d "./conf" ] && [ -e "./conf.tar" ] && tar xf ./conf.tar -C . ./conf && echo "-- ./conf.tar extracted"
  #  add ready made configs to menu 
  ./conf/add_config.sh
  #set last used revision in Config.in
  SVN_REV="$(svnversion . )" && let "SVN_REV=$(echo ${SVN_REV##*:} | tr -d '[:alpha:]')" && sed -i -e "s|default \"....\" # dont edit this line|default \"$SVN_REV\" # dont edit this line|" ./Config.in
  sed -i '72,73d' Makefile
  sed -i '72i\\t\tKCONFIG_AUTOHEADER=\$(CONFIG)\/buildroot-config\/autoconf.h\; then \\' Makefile
  make
  sed -i '72d' Makefile
  sed -i '72i\\t\tKCONFIG_AUTOHEADER=\$(CONFIG)\/buildroot-config\/autoconf.h \\' Makefile
  sed -i '73i\\t\t\$(CONFIG)\/mconf \$(CONFIG_CONFIG_IN)\; then \\' Makefile
}
package() {
  mkdir -p $pkgdir/opt/speed2fritz $pkgdir/usr/bin
  cp -r $srcdir/speed-to-fritz/* $pkgdir/opt/speed2fritz
  echo -e '#!/bin/bash\ncd /opt/speed2fritz\n#!/bin/bash\nif [[ $EUID -ne 0 ]]; then\necho "This script must be run as root" 1>&2\nexit 1\nfi\n./start' > $pkgdir/usr/bin/speed2fritz
  chmod a+x $pkgdir/usr/bin/speed2fritz
}
