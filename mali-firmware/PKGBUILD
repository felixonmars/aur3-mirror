# Maintainer: smotocel69 <smotocel69@gmail.com>

pkgname=mali-firmware
pkgver=r3p0
pkgrel=0
pkgdesc="Mali implementation of OpenGL ES, OpenVG and EGL(x11 and framebuffer)"
arch=('armv7h')
url="http://github.com/linux-sunxi/sunxi-mali"
license=('custom')
depends=('libump-git')
makedepends=('git')
provides=('libMali' 'mali-firmware')
conflicts=('libMali' 'mali-firmware')
replaces=('libMali' 'mali-firmware')

build() {
	cd $srcdir
	if [[ -d $pkgname ]]; then
		cd $pkgname && git pull origin
	else
		git clone $url --depth 1
	fi
	rm -rf $srcdir/build
	cd sunxi-mali 
	git submodule init
	git submodule update
	cd $srcdir
	mv sunxi-mali $pkgname
	cp -r $srcdir/$pkgname $srcdir/build
	cd $srcdir/build
	
}

package() {
	mkdir -p $pkgdir/opt/mali/x11/{lib,include}
	mkdir -p $pkgdir/opt/mali/framebuffer/{lib,include}
	cd $srcdir/build
	VERSION=r3p0 ABI=armhf EGL_TYPE=x11 make config
	cd $srcdir/build/lib/mali
	make install prefix=$pkgdir/opt/mali/x11/
	cd $srcdir/build/include/
	make install_egl prefix=$pkgdir/opt/mali/x11/
	make install_gles prefix=$pkgdir/opt/mali/x11/
	make install_gles2 prefix=$pkgdir/opt/mali/x11/
	make install_khr prefix=$pkgdir/opt/mali/x11/
	cd $srcdir/build
	VERSION=r3p0 ABI=armhf EGL_TYPE=framebuffer make config
	cd $srcdir/build/lib/mali
	make install prefix=$pkgdir/opt/mali/framebuffer/
	cd $srcdir/build/include/
	make install_egl prefix=$pkgdir/opt/mali/framebuffer/
	make install_gles prefix=$pkgdir/opt/mali/framebuffer/
	make install_gles2 prefix=$pkgdir/opt/mali/framebuffer/
	make install_khr prefix=$pkgdir/opt/mali/framebuffer/
}
