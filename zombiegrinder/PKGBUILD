# Maintainer: Rene Schoebel <schoebel.r at gmail dot com>

pkgname=zombiegrinder
pkgver=latest
pkgrel=1
pkgdesc="A Zombie shooter, controlled with the keyboard"
arch=(i686 x86_64)
url="http://www.twindrills.com/"
license=('unknown')
depends=(fmodex libxpm libxxf86vm glu libxft)
[ "$CARCH" == "x86_64" ] && depends=(lib32-fmodex lib32-libxpm lib32-libxxf86vm lib32-glu lib32-libxft)

source=(http://www.twindrills.com/uploads/game_updates/zombie_grinder/${pkgname}_stub_linux.tar.gz
	$pkgname.desktop
	$pkgname.png)
md5sums=('78df45496bbc28033a7d3361399d6f77'
	 '2fa540cc745feb0e66469341399b1de8'
	 '24b54e8c2d4a628116d1fc35db551984')

build() {
  msg "Nothing to do in build()"
}

package() {
  install -Dm755 "$srcdir/${pkgname}_stub_linux/ZombieGrinder" "$pkgdir/usr/bin/zombiegrinder"
  install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
