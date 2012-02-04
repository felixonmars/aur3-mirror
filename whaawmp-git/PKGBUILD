# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=whaawmp-git
pkgver=20110424
pkgrel=1
pkgdesc="A GTK+ Media player written in python and using gstreamer"
arch=('i686' 'x86_64')
url="http://home.gna.org/whaawmp/"
license=('GPL3')
depends=('gstreamer0.10-good' 'gstreamer0.10-python' 'pygtk' 'pyxdg')
optdepends=('gstreamer0.10-bad-plugins: for DVD menu support')
makedepends=('git' 'intltool')
conflicts=('whaawmp')
provides=('whaawmp')

_gitname=whaawmp
_gitroot=git://gitorious.org/whaawmp/mainline.git
 
build() {
  cd $srcdir

  msg "Connecting to gitorious.org GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull --rebase
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd mainline

  python2 setup.py install --prefix=/usr --root=$pkgdir
}