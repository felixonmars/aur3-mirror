# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=set-git
pkgver=20130226
pkgrel=1
pkgdesc="Social Engineering Toolkit (SET): a python-driven suite of custom tools focusing on attacking the human element of pentesting"
arch=('i686' 'x86_64')
url="https://www.trustedsec.com/downloads/social-engineer-toolkit/"
license=('BSD')
depends=('metasploit' 'python2' 'python2-beautifulsoup3' 'python2-pexpect')
makedepends=('git')
optdepends=('ettercap: DNS spoofing and ARP cache poisoning capabilities'
      'sendmail: email address spoofing'
      'java-runtime: create self-signed JAVA applets and spoof publisher'
      'python2-pefile: advanced AV evasion via hijacking a legit digital certificate'
      'apache: increase speed of web attack vectors'
      'openssl: create self-signed SSL certificates'
      'xterm: default terminal for SET command center'
      'upx: executable packer for better AV evasion'
      'aircrack-ng: rouge access point capabilities'
      'dsniff: DNS spoofing capabilities')
provides=('set')
noextract=()
options=('!strip')
backup=('usr/src/SET/config/set_config')
md5sums=() #generate with 'makepkg -g'

url="https://www.trustedsec.com/downloads/social-engineer-toolkit/"
_gitroot="git://github.com/trustedsec/social-engineer-toolkit.git"
_gitname=('SET')

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  mkdir -p ${pkgdir}/usr/{bin,src} || return 1
  mkdir -p ${pkgdir}/usr/share/licenses/${_gitname} || return 1
  cd ${pkgdir}/usr/src
    cp -pR ${srcdir}/${_gitname-build} ${_gitname} || return 1

  # archlinux fixes
  cd ${pkgdir}/usr/src/${_gitname}
  grep -rl python ${pkgdir}/usr/src/${_gitname}/ | xargs sed -i 's|python|python2|g' || return 1
  # TODO: working on a sane'r way to repalce 'python' with 'python2' in ALL necessary files
   #sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
   #       -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
   #       $(find ${pkgdir}/usr/src/${_gitname}/ -name '*.py' -o -name 'set' -o -iname 'set-automate' -o -iname 'set-proxy' -o -iname 'set-update' -o -iname 'set-web' ) || return 1
  cd ${pkgdir}/usr/src/${_gitname}/config
  #check if metasploit-svn or metasploit stable is installed (metasploit-svn takes presidence)
  #apply archlinux metasploit/httpd/dnsspoof/airbase-ng home directory to set_config
  if [ -d /usr/src/metasploit ]; then
    sed -i 's|/opt/metasploit/msf3|/usr/src/metasploit|g' ./set_config || return 1
  else
    sed -i 's|/opt/metasploit/msf3|/opt/metasploit|g' ./set_config || return 1
  fi
  sed -i 's|/var/www|/srv/http|g' ./set_config || return 1
  sed -i 's|/usr/local/sbin/dnsspoof|/usr/sbin/dnsspoof|g' ./set_config || return 1
  sed -i 's|/usr/local/sbin/airbase-ng|/usr/sbin/airbase-ng|g' ./set_config || return 1
  cd ${srcdir}/${_gitname}/readme
  install -Dm644 ${srcdir}/${_gitname}/readme/LICENSE ${pkgdir}/usr/share/licenses/${_gitname}/LICENSE || return 1

  #create startup app @ /usr/bin/se-toolkit
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/se-toolkit
  echo "if [ \"\$1\"  = \"-h\" ] || [ \"\$1\" = \"--help\" ]; then" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \".::[ \e[1;31mSocial Engineering Toolkit - S.E.T.\e[0m ]::.\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"\e[1;31mUsage:\e[0m \e[1;34m/usr/bin/SET\e[0m \e[1;31m[\e[0m\e[1;36m-a <path/file>\e[0m\e[1;31m|\e[0m\e[0m\e[1;36m-c\e[0m\e[1;31m|\e[0m\e[1;36m-p\e[1;31m|\e[0m\e[1;36m-e\e[1;31m|\e[0m\e[1;36m-h\e[0m\e[1;31m]\e[0m\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"  COMMAND LINE ARGUMENTS\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"  \e[1;36m(DEFAULT/NONE)\e[0m => Social-Engineer Toolkit CLI\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"  \e[1;34m-a\e[0m <\e[1;32mpath/file\e[0m>  => Social-Engineer Toolkit Automation\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"  \e[1;34m-u\e[0m   => Upgrade SET\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"  \e[1;34m-p\e[0m   => SET-Proxy Configuration Utility\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"  \e[1;34m-d\e[0m   => Display entire SET config file '\e[0m\e[1;32m/usr/src/SET/config/set_config\e[0m'\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"  \e[1;34m-e\e[0m   => Display only enabled settings in SET config file\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"  \e[1;34m-h\e[0m   => Help dialogue\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "echo -e \"\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "elif [ \"\$1\" = \"-a\" ]; then" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cd /usr/src/SET" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  ./set-automate \"\$2\" \"\$3\" \"\$4\" \"\$5\" \"\$6\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cd -" >> ${pkgdir}/usr/bin/se-toolkit
  echo "elif [ \"\$1\" = \"-e\" ]; then" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  grep -v ^# /usr/src/SET/config/set_config" >> ${pkgdir}/usr/bin/se-toolkit
  echo "elif [ \"\$1\" = \"-p\" ]; then" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cd /usr/src/SET" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  ./set-proxy" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cd -" >> ${pkgdir}/usr/bin/se-toolkit
  echo "elif [ \"\$1\" = \"-u\" ]; then" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cd /usr/src/SET" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  ./set-update" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cd -" >> ${pkgdir}/usr/bin/se-toolkit
  echo "elif [ \"\$1\" = \"-d\" ]; then" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cd /usr/src/SET/config" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cat ./set_config" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cd -" >> ${pkgdir}/usr/bin/se-toolkit
  echo "else" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cd /usr/src/SET" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  ./set \"\$@\"" >> ${pkgdir}/usr/bin/se-toolkit
  echo "  cd -" >> ${pkgdir}/usr/bin/se-toolkit
  echo "fi" >> ${pkgdir}/usr/bin/se-toolkit
  chmod +x ${pkgdir}/usr/bin/se-toolkit
  ln -sf /usr/bin/se-toolkit ${pkgdir}/usr/bin/SET || return 1


  #user notification
  echo -e ""
  echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mrun '\e[0m\e[1;34m/usr/bin/SET -h\e[0m\e[1;31m' for an explanation of SET startup options\e[0m"
  echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31medit '\e[0m\e[1;34m/usr/src/SET/config/set_config\e[0m\e[1;31m' to customize the SET configuration\e[0m"
  echo -e "\e[1;34m>>>\e[0m \e[1;31mSET homepage @ \e[0m\e[1;32mhttps://www.trustedsec.com/downloads/social-engineer-toolkit/\e[0m"
  echo -e "\e[1;34m>>>\e[0m \e[1;31mSocial Engineering Framework @ \e[0m\e[1;32mhttp://www.social-engineer.org/framework/Social_Engineering_Framework\e[0m"
  echo -e ""
}
# vim:set ts=2 sw=2 et:
