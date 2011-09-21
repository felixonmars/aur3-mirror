# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=icmpsh-git
pkgver=20110921
pkgrel=1
pkgdesc="icmpsh is a simple reverse ICMP shell with a win32 slave and a POSIX compatible master in C, Perl or Python"
arch=('i686' 'x86_64')
url=("http://github.com/inquisb/icmpsh")
license=('GPL')
provides=('icmpsh')
makedepends=('git' 'gcc')
optdepends=('perl: required to use the perl master server'
	    'perl-netpacket: required to use the perl master server'
	    'perl-net-rawip: required to use the perl master server'
	    'python2: required to use the python2 master server'
	    'impacket: required to use the python2 master server'
	    'mingw32-gcc: required to build icmpsh win32 C slave on linux'
	    'mingw32-w32api: required to build icmpsh win32 C slave on linux')
_gitroot=("http://github.com/inquisb/icmpsh.git")
_gitname=("icmpsh")

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
  cd ${srcdir}/${_gitname}-build

  gcc -o icmpsh-m icmpsh-m.c || return 1
  #check if i486-mingw32-gcc and winsock2.h exist, if so compile the C-based slave  on linux
  if [ -f /usr/bin/i486-mingw32-gcc ] && [ -f /usr/i486-mingw32/include/winsock2.h ]; then
	  i486-mingw32-gcc -o icmpsh-s icmpsh-s.c -lwsock32 || return 1
  fi
  #archlinux python2 fix
  sed -i 's|python$|python2|g' icmpsh_m.py || return 1
}
package() {
  cd ${srcdir}/${_gitname}-build
  install -d ${pkgdir}/usr/src/${_gitname} || return 1
  install -d ${pkgdir}/usr/bin || return 1
  install -Dm755  ${srcdir}/${_gitname}-build/icmpsh-m.c \
    ${pkgdir}/usr/src/${_gitname} || return 1
  install -Dm755  ${srcdir}/${_gitname}-build/icmpsh-m \
    ${pkgdir}/usr/src/${_gitname} || return 1
  install -Dm755  ${srcdir}/${_gitname}-build/icmpsh-s.c \
    ${pkgdir}/usr/src/${_gitname} || return 1
  install -Dm755  ${srcdir}/${_gitname}-build/icmpsh-s \
    ${pkgdir}/usr/src/${_gitname} || return 1
  install -Dm755  ${srcdir}/${_gitname}-build/icmpsh-m.pl \
    ${pkgdir}/usr/src/${_gitname} || return 1
  install -Dm755  ${srcdir}/${_gitname}-build/icmpsh_m.py \
    ${pkgdir}/usr/src/${_gitname} || return 1
  install -Dm755  ${srcdir}/${_gitname}-build/icmpsh.exe \
    ${pkgdir}/usr/src/${_gitname} || return 1
  ln -s /usr/src/${_gitname}/icmpsh-m.pl \
    ${pkgdir}/usr/bin/icmpsh-m.pl || return 1
  ln -s /usr/src/${_gitname}/icmpsh_m.py \
    ${pkgdir}/usr/bin/icmpsh_m.py || return 1
  ln -s /usr/src/${_gitname}/icmpsh-m \
    ${pkgdir}/usr/bin/icmpsh-m || return 1
  install -Dm644 README \
    ${pkgdir}/usr/src/${_gitname}/README || return 1
  cp -R screenshots ${pkgdir}/usr/src/${_gitname} || return 1
}
