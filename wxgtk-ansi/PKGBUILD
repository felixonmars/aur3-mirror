# Maintainer: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# based on wxgtk and wxgtk-2.6-ansi PKGBUILDs (thanks, guys)
# 

pkgname=wxgtk-ansi
pkgver=2.8.11
pkgrel=2
pkgdesc="wxGTK - GTK+ implementation of wxWidgets API for GUI - ANSI version (no unicode)"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
depends=('wxgtk')
makedepends=('libgnomeprintui' 'gstreamer0.10-base-plugins' 'gconf' 'ccache' 'sed' 'mesa')
source=(http://downloads.sourceforge.net/wxwindows/wxGTK-${pkgver}.tar.bz2 http://trac.wxwidgets.org/raw-attachment/ticket/12959/wx-png-1.5-2.diff)
md5sums=('6040933d200037f90f6aa1c5169e7ec6' '38ba9879f4cdf85c43f0d20aa1412e92')
sha1sums=('e979d9d2b1ee5bd10e90fd00b02f3306327c661a' 'bfbb9b8d35bee0a07101502e9664dda4bc7cbf02')

build() {
	cd "${srcdir}/wxGTK-${pkgver}"

	patch -p0 <../wx-png-1.5-2.diff
	
	# this ensures that /usr/lib is searched even on x86_64
	sed '/SEARCH_LIB=/s|/usr/\$wx_cv_std_libpath|& /usr/lib|' -i configure
	
	./configure --prefix=/usr --libdir=/usr/lib --with-gtk=2 --with-opengl --disable-unicode \
		--enable-graphics_ctx --with-gnomeprint --disable-optimize --enable-mediactrl \
		--with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys || return 1

	make || return 1
	make -C locale allmo || return 1
	make DESTDIR="${pkgdir}" install || return 1
	cd contrib/src
	make || return 1
	make DESTDIR="${pkgdir}" install || return 1

	# take care of the ANSI thing
	# (this is needed to allow installation of both 
	# Unicode and non-unicode build)
	rm -rf "${pkgdir}/usr/share"
	# we need to install this back
	install -D -m644 ../../docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/bin"
}
