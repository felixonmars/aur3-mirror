# Maintainer: Michal Gawronski <dinth1906@gmail.com>

pkgname=ttf-canonical
pkgver=0.1.10
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="http://design.canonical.com/"
license=('closed')
depends=('xorg-font-utils' 'fontconfig' 'xorg-fonts-encodings')
makedepends=()
provides=()
conflicts=()
source=('UbuntuBold.ttf.bz2'
	'UbuntuBoldItalic.ttf.bz2'
	'UbuntuRegular.ttf.bz2'
	'UbuntuItalic.ttf.bz2')
md5sums=('50fd500fe08188a4dbcd4b0b5a540f8e'
         'f033a905c0923cfbff16a75cccb77bfa'
         '24ed6dab73116902561dcfbee30a3181'
         '59b3dcc090f06b2a8b5f760949777f09')

build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/fonts/TTF
  install -m 644 *.ttf $pkgdir/usr/share/fonts/TTF
}
