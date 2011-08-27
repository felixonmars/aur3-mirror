# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gadmin-control-panel
pkgver=0.0.4
pkgrel=1
pkgdesc="Control Panel for Gadmin Tools"
arch=('i686' 'x86_64')
url="http://mange.dynalias.org/linux/gadmintools-webpage/app_pages/gadmin-control-panel.html"
license=('GPL')
depends=('gtk2')
makedepends=()
optdepends=('gksu: Graphical SU Support')
source=("http://mange.dynalias.org/linux/$pkgname/$pkgname-$pkgver.tar.gz" "$pkgname.desktop")
md5sums=('b7d64dca2b994ad2770348f3a76c4639'
         'c861e3a536b134ff9448db4d6106db85')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
