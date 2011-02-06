# Contributor: raubkopierer <mail[dot]sensenmann[at]googlemail[dot]com>
pkgname=rattlekekz-qt-git
pkgver=20110121
pkgrel=1
pkgdesc="a qtView for the rattlekekz crumbled client"
url="http://github.com/Jem777/rattlekekz"
arch=('i686' 'x86_64')
license=('GPL' 'MIT')
depends=('python2' 'rattlekekz-git' 'python2-qt')
provides=('twisted-qt4-git')
makedepends=('git' 'python2')

_gitroot="git://github.com/raubkopierer/rattlekekz-qt.git"
_gitname="rattlekekz-qt"

build() {
  cd ${srcdir}
  msg "Connecting to github.com GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/${_gitname}
  python2 setup.py install --prefix ${pkgdir}/usr
} 

