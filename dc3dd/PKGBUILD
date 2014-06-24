# Maintainer: Jan Horcicka <horho77 at gmail dot com>
# Contributor: <bender02 at archlinux dot us>

pkgname=dc3dd
pkgver=7.2.641
pkgrel=1
pkgdesc="A patched version of dd that includes a number of features useful for computer forensics"
url="http://sourceforge.net/projects/dc3dd"
license=(GPL3)
arch=(any)
makedepends=(perl-locale-gettext)
source=(http://downloads.sf.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
# md5sums are verifiable from upstream
md5sums=(051999b8c6bee9b773fc6494da6e717e)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
