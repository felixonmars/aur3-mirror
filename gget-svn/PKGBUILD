# Contributor: JD Horelick <jdhore1@gmail.com>
pkgname=gget-svn
pkgver=39
pkgrel=2
pkgdesc="A GTK+ Download Manager"
arch=('i686')
url="http://live.gnome.org/gget"
license=('GPL')
depends=('gnome-python-extras' 'python-notify')
makedepends=('pkgconfig')
source=()
md5sums=()

_svntrunk=http://svn.gnome.org/svn/gget/trunk
_svnmod=gget

build() {
    cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  ./autogen.sh

  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
