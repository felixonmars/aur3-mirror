# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=xphp-pecl-wxwidgets
pkgdesc='PHP Pecl wxWidgets extension'
pkgver=git
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/wxwidgets'

makedepends=('xphp' 'wxgtk')
source=("git+https://github.com/wxphp/wxphp.git")
md5sums=('SKIP')
depends=('xphp' 'wxgtk' 'icu' 'libwebp' 'libxcb')

peclconfig="--prefix=/opt/xphp \
 --bindir=/opt/xphp/bin \
 --libdir=/opt/xphp/lib \
 --sysconfdir=/etc/xphp \
 --mandir=/opt/xphp/man \
 --with-php-config=/opt/xphp/bin/php-config
"

build() {

	rm -fr "${srcdir}/wxphp-build"
	cp -R "${srcdir}/wxphp" "${srcdir}/wxphp-build"
	cd "${srcdir}/wxphp-build"

	export PATH="/opt/xphp/bin:$PATH"

	/opt/xphp/bin/phpize || return 1
	php tools/reference_generator.php

#	WX_LDFLAGS="-pthread -lwx_gtk2u-3.0 -lwx_gtk2u_gl-3.0 -lwxregexu-3.0 -lwxscintilla-3.0"
#	OTHER_LDFLAGS=`pkg-config --libs gstreamer-0.10 gstreamer-interfaces-0.10 gtk+-2.0 libpng zlib`	
#	LDFLAGS="${WX_LDFLAGS} ${OTHER_LDFLAGS} -ljpeg"
#--enable-wxwidgets-monolithic
	./configure --with-wxwidgets=/usr/lib --enable-maintainer-zts
	make
}

package_xphp-pecl-wxwidgets() {

	cd "${srcdir}/wxphp-build"
	make INSTALL_ROOT=${pkgdir} install
	install -D -m 644 $startdir/wxwidgets.ini ${pkgdir}/etc/xphp/conf.d/wxwidgets.ini || return 1
}
