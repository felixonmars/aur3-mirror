# Maintainer: Jonas Jelten <jonas.jelten@gmail.com>
pkgname=spacezero
pkgver=0.84.02
pkgrel=2
pkgdesc='A RTS space game'
url="http://spacezero.sourceforge.net/index.html"
arch=('x86_64' 'i686')
license=('GPL')
depends=('make' 'gtk2' 'glib2' 'openal' 'freealut')
optdepends=()
makedepends=()
conflicts=(spacezero-git spacezero-svn)
replaces=()
backup=()
source=("http://sourceforge.net/projects/spacezero/files/spacezero%200.84/spacezero-0.84.02.tar.gz")

md5sums=('9f3d5dc0cf9c31cc6b0dc4dee35bf09e')

# HOME is a dirty hack to fix the Makefile...
makeflags="HOME=/tmp INSTALL_DATA_DIR=$pkgdir/usr/share/spacezero INSTALL_DIR=$pkgdir/usr/bin"


build() {
  cd "$srcdir/$pkgname"
  make $makeflags 
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/doc/spacezero
  cp -R html/manual.html html/manual_files $pkgdir/usr/share/doc/spacezero
  #install -D -m755 $srcdir/bin/spacezero $pkgdir/usr/bin/
  make $makeflags install
}

