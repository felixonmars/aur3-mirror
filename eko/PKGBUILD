# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=eko
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple sound editor based on Qt, libsndfile, and libsample rate."
arch=(i686 x86_64)
url="http://semiletov.org/eko/"
license=('GPL')
depends=('qt4' 'jack')
install="$pkgname.install"
options=('!strip')
source=("${url}/dloads/$pkgname-$pkgver.tar.bz2"
        "$pkgname.desktop")
md5sums=('b9dd398e692a159949ddb05d00afea3c'
         'a10ec56761ce95a8f8e7c9fa464ad0bb')

build() {
  cd $pkgname-$pkgver
  qmake-qt4 PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 icons/${pkgname}_icon.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
