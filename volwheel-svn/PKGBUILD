# Maintainer: Vinycius Maia <suportevg@uol.com.br>

pkgname=volwheel-svn
pkgver=r52
pkgrel=5
pkgdesc="VolWheel is a little application which lets you control the sound volume."
url="http://oliwer.net/b/volwheel.html"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('subversion')
conflicts=('volwheel')
provides=('volwheel=0.2.8')
depends=('gtk2-perl' 'hicolor-icon-theme')
optdepends=('alsa-utils: for amixer support'
            'oss: for ossmix support')
install="${pkgname}.install"
source="${pkgname}.install"
md5sums='b2ebab59089be208323356fef393640a'
_svnsource=http://olwtools.googlecode.com/svn/trunk/volwheel

build() {
	cd "${srcdir}"
	svn export ${_svnsource} volwheel-svn --force
}

package() {
	cd ${pkgname}
	
	if [ "${prefix}" != "/usr/local" ]; then
		sed -i 's/\/usr\/local/\/usr/g' volwheel
		sed -i 's/${prefix}/\/usr/g' volwheel
	else
		sed -i 's/${prefix}/\/usr\/local/g' volwheel
	fi
	
	sed -i 's/0.2.8/svn/g' volwheel
	sed -i 's/2010-08-01/Jun-11-2012/g' volwheel
	
	install -v -d "${pkgdir}/usr/bin"
	install -v -d "${pkgdir}/usr/lib/${pkgname%%-*}"
	install -v -d "${pkgdir}/usr/share/${pkgname%%-*}"
	install -v -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -v -d "${pkgdir}/usr/share/applications"
	install -v -m755 volwheel "${pkgdir}/usr/bin"
	install -v -m644 lib/* "${pkgdir}/usr/lib/${pkgname%%-*}"
	cp -v -r icons "${pkgdir}/usr/share/${pkgname%%-*}"
	install -v -m644 icons/volwheel.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -v -m644 volwheel.desktop "${pkgdir}/usr/share/applications"
}
