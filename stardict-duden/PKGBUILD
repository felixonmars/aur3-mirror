# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=stardict-duden
pkgver=2.4.2
pkgrel=2
pkgdesc="Duden dictionary for StarDict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net/"
license=('unknown')
depends=('stardict')
source=(http://temp.lta.tw/stardict-dic/de/$pkgname-$pkgver.tar.bz2)
sha256sums=('ee417b69623e1e2314d64a65c21017b0549e249886806ea9ab7034636ca943e2')

package() {
  cd ${srcdir}/$pkgname-$pkgver

  install -d ${pkgdir}/usr/share/stardict/dic
  install -m 644 duden.dict.dz duden.idx duden.ifo ${pkgdir}/usr/share/stardict/dic/
}
