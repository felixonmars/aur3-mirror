# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=libgphoto2-svn
pkgver=13149
pkgrel=1
pkgdesc="gPhoto is a program and library framework that lets users download pictures from their digital cameras."
arch=(i686 x86_64)
url="http://www.gphoto.org"
license=('GPL')
depends=('libexif' 'libusb')
makedepends=('subversion' 'automake' 'autoconf' 'libtool' 'gettext' 'pkg-config')
provides=('libgphoto2=2.4.99.7')
conflicts=('libgphoto2')
replaces=('libgphoto2')

_svntrunk=https://gphoto.svn.sourceforge.net/svnroot/gphoto/trunk/libgphoto2
_svnmod=libgphoto2

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  autoreconf --install --symlink
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
