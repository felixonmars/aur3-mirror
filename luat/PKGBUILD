# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>
pkgname=luat
pkgver=20140426
pkgrel=1
pkgdesc="C-library for lua to receive simple system information like uptime, ram, processcount etc."
arch=('i686' 'x86_64')
url="http://gitorious.org/luat/luat"
license=('GPL3')
depends=('lua51')
makedepends=('git' 'autoconf' 'make')

_gitroot="git://gitorious.org/luat/luat.git"
_gitname="luat"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"

  cd ${srcdir}/${_gitname}
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
} 
package() {  
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} install || return 1
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/luat/LICENSE
}

# vim:set ts=2 sw=2 et:
