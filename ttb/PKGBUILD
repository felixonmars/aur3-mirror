# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=ttb
pkgrel=1
pkgver=20101101
pkgdesc="Browser for Teletekst pages in The Netherlands"
arch=('i686' 'x86_64')
url="http://www.djcbsoftware.nl/code/ttb/"
license=('GPL3')
depends=('pygtk')
makedepends=('git')


_gitroot="git://gitorious.org/ttb/mainline.git"
_gitname="ttb"


build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  	cd $_gitname && git pull origin
  	msg "The local files are updated."
  else
  	git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/mainline
  python2 setup.py install --prefix=/usr --root=$pkgdir
} 
