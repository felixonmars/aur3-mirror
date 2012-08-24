# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Simo Leone <neotuli@gmail.com>

pkgname=tuxkart
pkgver=0.4.0
pkgrel=7
pkgdesc="A 3D racing game featuring Tux"
arch=('i686' 'x86_64')
url="http://tuxkart.sourceforge.net"
license=('GPL')
depends=('libgl')
makedepends=('mesa' 'plib' 'libxmu' 'libxi')
source=($url/dist/$pkgname-$pkgver.tar.gz
        $pkgname.png
        $pkgname.desktop)
md5sums=('e84ab2748ff1ce5ef11d1d7da5188f8f'
         '9b773b60a3817533beb34606ab5fcce9'
         '247916dac9f6be35a5e1af79062eb9a3')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr

  sed -i "s_games/tuxkart_tuxkart_" {data,fonts,images,models,mods,wavs,src}/Makefile
  sed -i "s_\$(datadir)/tuxkart_\$(datadir)/doc/tuxkart_" doc/Makefile

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" bindir=/usr/bin install

  install -Dm644 "$srcdir"/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
