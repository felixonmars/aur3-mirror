# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Josef Lusticky <evramp@gmail.com>

DLAGENTS[1]+=' -A "Mozilla/4.0"'

pkgname=tintii
pkgver=2.9.0
pkgrel=1
pkgdesc="A smart photo filter for striking colour select effects"
arch=(i686 x86_64)
url="http://www.indii.org/software/tintii"
license=('GPL')
depends=('wxgtk' 'desktop-file-utils')
makedepends=('boost')
source=("http://www.indii.org/files/tint/releases/$pkgname-$pkgver.tar.gz"
        "http://www.indii.org/images/tintii_128.png" "$pkgname.desktop")
md5sums=('77dcf8e4c79f82f98c625fd7bed81c6f'
         'a135309f20688645df5aa26ca3310705'
         'f0dd9d57747d24b55547fc3e5c1ba4ec')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../${pkgname}_128.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
