# Contributor: Kai Hendry <hendry@iki.fi>
pkgname=rnv
pkgver=1.7.10
pkgrel=1
pkgdesc="RelaxNG Compact Syntax Validator"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/rnv/"
license=('BSD')
depends=('expat')
source=(http://downloads.sourceforge.net/sourceforge/rnv/$pkgname-$pkgver.tar.gz)
md5sums=('27868110c867d06fb5e4e85fddb99de6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  install -D -m644 "${srcdir}/$pkgname-$pkgver/$pkgname.1" ${pkgdir}/usr/share/man/man1/${pkgdir}.1
  install -D -m755 "${srcdir}/$pkgname-$pkgver/rnv"  ${pkgdir}/usr/bin/rnv
  install -D "${srcdir}/$pkgname-$pkgver/COPYING" ${pkgdir}/usr/share/licenses/$pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
