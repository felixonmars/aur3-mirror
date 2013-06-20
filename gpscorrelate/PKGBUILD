# Contributor: Hinrich Harms <arch@hinrich.de>
# Maintainer: sylvain alborini <sylvain.alborini@gmail.com>
pkgname=gpscorrelate
pkgver=1.6.2
pkgrel=1
pkgdesc="GPS Photo Correlation; Writes location data to EXIF tags using GPX files (command line and GTK interface)."
arch=(i686 x86_64)
url="https://github.com/freefoote/gpscorrelate"
license=('GPL2')
depends=('libxml2' 'gtk2' 'exiv2')
md5sums=()

_gitroot="https://github.com/freefoote/gpscorrelate.git"
_gitname="gpscorrelate"

build() {
 cd "$srcdir"
  msg "Connecting to GIT server.... $srcdir"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/$pkgname
  make prefix=/usr DESTDIR=$pkgdir install || return 1
}
