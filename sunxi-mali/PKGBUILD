# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=sunxi-mali
pkgver=20130304
pkgrel=1
pkgdesc="Mali implementation of OpenGL ES, OpenVG and EGL"
arch=('armv7h')
url="http://github.com/linux-sunxi/sunxi-mali"
license=('custom')
depends=('libgl')
makedepends=('git')
provides=('libump' 'mali400' 'mali-libs')
conflicts=('libump' 'mali400' 'mali-libs')
replaces=('libump' 'mali400' 'mali-libs')

_VERSION=r3p1
_ABI=armhf
_EGL_TYPE=x11

build() {
	cd $srcdir
	if [[ -d $pkgname ]]; then
		cd $pkgname && git pull origin
	else
		git clone $url --recursive --depth 1
	fi
	rm -rf $srcdir/build
	cp -r $srcdir/$pkgname $srcdir/build
	cd $srcdir/build
	sed -i 's/dri2 -ldrm -lXfixes/GL/g' lib/ump/Makefile
	sed -i '/INSTALL_DATA/{p;:a;N;$!ba;d}' lib/mali/Makefile.mashup
	make VERSION=$_VERSION ABI=$_ABI EGL_TYPE=$_EGL_TYPE
}

package() {
	cd $srcdir/build
	mkdir -p $pkgdir/usr/{include,lib}
	make -C include install_ump prefix=$pkgdir/usr/
	make VERSION=$_VERSION ABI=$_ABI EGL_TYPE=$_EGL_TYPE -C lib install prefix=$pkgdir/usr/
}
