# Maintainer: Carlos Pita <carlosjosepita@gmail.com>
pkgname=dmenu-xft-space
pkgver=4.5
pkgrel=1
pkgdesc="Dynamic X menu - with xft support (surrounding space fix)"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
conflicts=('dmenu')
provides=('dmenu')
source=(http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz
        dmenu-4.5-xft.diff)
md5sums=('9c46169ed703732ec52ed946c27d84b4'
         'b892dc1f1ea60dd14735da21b944928d')

build() {
	cd $srcdir/dmenu-$pkgver
	patch -p1 < ../dmenu-$pkgver-xft.diff
	make
}

package() {
    cd "$srcdir/dmenu-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

