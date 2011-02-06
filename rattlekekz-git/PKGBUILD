# Contributor: raubkopierer <mail[dot]sensenmann[at]googlemail[dot]com>
pkgname=rattlekekz-git
pkgver=20110121
pkgrel=1
pkgdesc="crumbled chatclient written in python"
url="http://github.com/Jem777/rattlekekz"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('python2' 'twisted' 'python-urwid' 'pyopenssl' 'python2-bert-git')
makedepends=('git' 'python2')

_gitroot="git://github.com/Jem777/rattlekekz.git"
_gitname="rattlekekz"

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

