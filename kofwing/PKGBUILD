# Maintainer: M4rQu1Nh0S <zonadomarquinhos@gmail.com>
pkgname=kofwing
pkgver=1.9
pkgrel=1
pkgdesc="A free windows port version of the game The King of Fighters in version Wing"
arch=('any')
url="http://www.flashwing.net"
license=('freeware')
groups=('games')
depends=('wine>=1.5.0')
makedepends=('unzip' 'plowshare-git')
source=('kofwing.desktop' 'kofwing.jpg')
md5sums=('bd885eff1c19019200721941df37337c'
	 'fd659b4a602e34d936be7014edb01209')

build() {
  plowdown -o ${srcdir} http://www.mediafire.com/download/j3hdk8h9yr37ec0/%E6%8B%B3%E7%9A%87Wing+v${pkgver}.zip || unzip -xo -d $pkgname-$pkgver '拳皇Wing v1.9.zip'
}

package() {
 install -d $pkgdir/usr/share/
 mv $pkgname-$pkgver/ $pkgdir/usr/share/$pkgname-$pkgver

 install -D $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
 install -D $startdir/$pkgname.jpg $pkgdir/usr/share/icons/$pkgname.jpg
}

# vim:set ts=2 sw=2 et: