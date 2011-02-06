pkgname=pygtkchart-git
pkgver=20100523
pkgrel=1
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
  msg "Starting make..."
  
  cd $_gitname
  python setup.py build
  python setup.py install --prefix=/usr --root=$startdir/pkg
}

