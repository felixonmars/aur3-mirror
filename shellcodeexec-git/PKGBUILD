# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=shellcodeexec-git
pkgver=20110921
pkgrel=1
pkgdesc="Script to execute in memory a sequence of opcodes (can be compiled and works on POSIX and Windows systems)"
arch=('i686' 'x86_64')
url=("http://github.com/inquisb/shellcodeexec")
license=('GPL')
provides=('shellcodeexec')
makedepends=('git' 'gcc')
optdepends=('metasploit: useful for generation of payloads and alphanumeric shellcode')
_gitroot=("http://github.com/inquisb/shellcodeexec.git")
_gitname=("shellcodeexec")

build() {
  cd ${srcdir}

 ## Git checkout
  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin || return 1
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot} || return 1
  fi
  msg "Checkout completed"

 ## Build
  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

  cd ${srcdir}/${_gitname}-build/linux
  make
}
package() {
  cd ${srcdir}/${_gitname}-build
  install -d ${pkgdir}/usr/src/${_gitname} || return 1
  install -d ${pkgdir}/usr/bin || return 1
  cp -R * ${pkgdir}/usr/src/${_gitname} || return 1
  ln -s /usr/src/${_gitname}/linux/shellcodeexec \
    ${pkgdir}/usr/bin/shellcodeexec || return 1

  #user notification
  echo -e ""
  echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31msee Bernardo's blogpost on shellcodeexec @ '\e[0m\e[1;34mhttp://bernardodamele.blogspot.com/2011/04/execute-metasploit-payloads-bypassing.html\e[0m\e[1;31m'\e[0m"
  echo -e ""
}
