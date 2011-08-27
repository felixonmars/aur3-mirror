# $Id$
# Contributor: Peter Simons <simons@cryp.to>

pkgname=maude-mode
pkgver=0.2
pkgrel=2
pkgdesc="Maude mode package for Emacs"
arch=('i686' 'x86_64')
license=('GPL')
url="http://maude-mode.sourceforge.net/"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
depends=('emacs')
md5sums=('cde01a226b8dbb5071c37009ae6c9a58')

build() {
  cd "$srcdir/$pkgname-$pkgver" || return 1
  sed -i -e 's#/usr/local/bin/maude#maude#g' maude-mode.el || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
