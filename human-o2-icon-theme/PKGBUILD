# Maintainer: twa022 <twa022@gmail.com>

pkgname=human-o2-icon-theme
pkgver=1.1.5.1
pkgrel=1
pkgdesc="Icon theme for GTK2"
arch=('any')
license=('GPL')
depends=('gtk2')
url="http://schollidesign.deviantart.com/art/Human-O2-Iconset-105344123"
source=(http://www.deviantart.com/download/105344123/Human_O2___Iconset_by_schollidesign.zip)
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('bf6f33e7cbf40c6bd977e3da7ac5b5fe')

build() {
  cd ${startdir}/src/
  mkdir -p $pkgdir/usr/share/icons/
  tar -xf Human-O2.tar -C $pkgdir/usr/share/icons
}
