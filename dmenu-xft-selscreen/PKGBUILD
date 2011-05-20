# Maintainer: Bharani Deepan <bharanideepan at_ gmail >
# Maintainer: Ian Yang <me at_ iany.me >
pkgname=dmenu-xft-selscreen
pkgver=4.3.1
pkgrel=1
pkgdesc="Dynamic X menu - with xft support"
arch=('i686' 'x86_64')
url="http://code.suckless.org/"
license=('MIT')
depends=('libx11' 'libxinerama' 'libxft')
conflicts=('dmenu')
provides=('dmenu')
source=(http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz
        dmenu-$pkgver-xft.patch
        dmenu-$pkgver-xft-selscreen.patch)

md5sums=('6b619f6901bf4765442b4e410b1e5410'
         '5650d814a027bf55a7193800670ffd79'
         'b98b3f7a41caa04680db221131a90d34')


build() {
	cd $srcdir/dmenu-$pkgver
	patch -p1 < ../dmenu-$pkgver-xft.patch || return 1
	patch -p1 < ../dmenu-$pkgver-xft-selscreen.patch || return 1
	make || return 1
	make DESTDIR=$pkgdir PREFIX=/usr install || return 1
    # LICENSE
	mkdir -p $pkgdir/usr/share/licenses/$pkgname || return 1
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/ || return 1
}

