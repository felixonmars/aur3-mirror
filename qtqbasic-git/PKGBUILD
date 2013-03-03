# Contributor: Jean-Marc AMBROSINO <jmambrosino@gmail.com>
# Maintainer: David Zaragoza <david@zaragoza.com.ve>

pkgname=qtqbasic-git
pkgver=20130303
pkgrel=1
pkgdesc="A Qt realization of QuickBASIC"
url="http://pashazz.blogspot.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4')
makedepends=('git')
source=('qtqbasic.desktop')
md5sums=('f2931c58501d95c8b0b8a46dd41ff7d6')

_gitroot="git://github.com/pashazz/qtqbasic.git"
_gitname="qtqbasic"

build() {
  cd ${srcdir}
  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
  cd ${_gitname} && git pull origin
  msg "The local files are updated."
  else
  git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  git clone ${_gitname} ${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  qmake-qt4
  make || return 1

  install -Dm755 QtQBasic ${pkgdir}/usr/bin/qtqbasic
  install -Dm644 ${srcdir}/qtqbasic.desktop ${pkgdir}/usr/share/applications/qtqbasic.desktop

} 
