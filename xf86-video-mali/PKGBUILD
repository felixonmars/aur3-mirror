# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=xf86-video-mali
pkgver=20130224
pkgrel=1
pkgdesc="X.org mali video driver"
arch=('armv7h')
url="http://github.com/linux-sunxi/xf86-video-mali"
license=('MIT')
depends=('sunxi-mali' 'xorg-server')
makedepends=('git' 'automake' 'autoconf' 'libtool' 'xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=13')
conflicts=('xorg-server<1.13.0' 'X-ABI-VIDEODRV_VERSION<13' 'X-ABI-VIDEODRV_VERSION>=14')
groups=('xorg-drivers' 'xorg')

build() {
	cd $srcdir
	if [[ -d $pkgname ]]; then
		cd $pkgname && git pull origin
	else
		git clone $url --depth 1
	fi
	rm -rf $srcdir/build
	cp -r $srcdir/$pkgname $srcdir/build
	cd $srcdir/build
	aclocal
	autoheader
	libtoolize
	automake --add-missing
	autoconf
	./configure
	make
}

package() {
	cd $srcdir/build
	make prefix=$pkgdir/usr install
}
