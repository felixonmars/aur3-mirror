# Maintainer: Tim Hartman <tbhartman at gmail>
pkgname=lsprepost2
pkgver=2.4
pkgrel=2
pkgdesc="Pre- and post-processor for LS-DYNA"
arch=("x86_64")
url=("http://www.lstc.com/lspp")
license=('unknown')
depends=('openmotif' 'mesa' 'libxpm')
makedepends=('chrpath')
source=(${pkgname}-${pkgver}.gz::ftp://ftp.lstc.com/outgoing/lsprepost/${pkgver}/linux64/${pkgname}_4_linux64_suse110.gz)
md5sums=('24e2096f6889157742bed0fb94450527') #generate with 'makepkg -g'

build() {
  cd "$srcdir"
  mv "$pkgname-$pkgver" "$pkgname"
  chmod 755 "$pkgname"
  
  chrpath -d "$pkgname"
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  cp "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
