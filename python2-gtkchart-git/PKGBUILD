pkgname=python2-gtkchart-git
pkgver=20110126
pkgrel=2
pkgdesc="Bar charts, pie charts, and line graph widgets for pygtk"
url=http://notmyname.github.com/pygtkChart
license=GPL
depends=('pygtk')
makedepends=('git')
provides=('pygtkchart')
arch=(i686 x86_64)

source=()
md5sums=()
noextract=()

_gitroot="git://github.com/notmyname/pygtkChart"
_gitname="pygtkchart"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}



package() {
  msg "Starting make..."

  cd $srcdir/$_gitname
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root=$pkgdir
}
