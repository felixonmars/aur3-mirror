# Maintainer: Pierre Réveillon <pierre@brin-de-toile.fr>
pkgname=myriad-music-plugin
pkgver=5.6.2m
pkgrel=2
pkgdesc="The Myriad Music browser plug-in"
arch=('i686', 'x86_64')
url="http://www.myriad-online.com/fr/products/mmplugin.htm"
license=('unknown')
depends=('nspluginwrapper')
makedepends=()
options=()
if test "$CARCH" == x86_64; then
  source=("http://www.myriad-online.com/linux/myriad-music-plugin-5.6.2m.1-1.amd64.deb")
  md5sums=('aa8c86353a7fef95206ce12d02e749ce')
  install=myriad-music-plugin.install
else
  source=("http://www.myriad-online.com/linux/myriad-music-plugin-5.6.2m.1-1.i386.deb")
  md5sums=('fd38b2667f550a935d8116ba041ba9ed')
fi

build() {
  tar xzf $srcdir/data.tar.gz -C $pkgdir
  mv $pkgdir/usr/share/fonts/truetype $pkgdir/usr/share/fonts/TTF
}
