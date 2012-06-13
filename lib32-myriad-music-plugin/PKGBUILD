# Maintainer: Pierre Réveillon <pierre@brin-de-toile.fr>
pkgname=lib32-myriad-music-plugin
pkgver=5.6.2m
pkgrel=1
pkgdesc="The Myriad Music browser plug-in (32 bits)"
arch=('x86_64')
url="http://www.myriad-online.com/fr/products/mmplugin.htm"
license=('unknown')
depends=()
makedepends=()
options=()
source=("http://www.myriad-online.com/linux/myriad-music-plugin-5.6.2m.1-1.i386.deb")
md5sums=('fd38b2667f550a935d8116ba041ba9ed')

build() {
  tar xzf $srcdir/data.tar.gz -C $pkgdir
  mv $pkgdir/usr/lib $pkgdir/usr/lib32
  mv $pkgdir/usr/share/fonts/truetype $pkgdir/usr/share/fonts/TTF
}
