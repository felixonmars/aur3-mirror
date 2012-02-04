# Contributor: raubkopierer <mail[dot]sensenmann[at]googlemail[dot]com>
pkgname=twisted-qt4-git
pkgver=20090822
pkgrel=1
pkgdesc="qt4reactor for the python twisted module"
url="http://www.tarbox.org/qtreactor/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('twisted' 'pyqt')
makedepends=('git')

_gitroot="git://github.com/ghtdak/qtreactor.git"
_gitname="qtreactor"

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

  mkdir ${pkgdir}/usr
  mkdir ${pkgdir}/usr/lib
  mkdir ${pkgdir}/usr/lib/python2.6
  mkdir ${pkgdir}/usr/lib/python2.6/site-packages
  cp ${srcdir}/${_gitname}/twisted ${pkgdir}/usr/lib/python2.6/site-packages -r
  cp ${srcdir}/${_gitname}/qt4reactor.py ${pkgdir}/usr/lib/python2.6/site-packages
} 

