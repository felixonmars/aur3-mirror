pkgname=gslimthemeviewer
pkgver=0.4
pkgrel=3
pkgdesc="Theme viewer for Slim"
url="http://www.archlinux.org"
arch=('any')
license=('GPL')
depends=('slim' 'gtk2-perl' 'perl-locale-gettext')
makedepends=('intltool' 'gettext')
groups=('multimedia')
install="$pkgname.install"
source=("https://www.dropbox.com/s/8rfe2zhvt0uqs53/gslimthemeviewer-0.4.tar.gz")
md5sums=('b9a3237b0ce1b64351e847330b526bdd')

build() {
	mkdir -p ${srcdir}/locale/es/LC_MESSAGES/
	msgfmt -c -v -o ${srcdir}/locale/es/LC_MESSAGES/$pkgname.mo ${srcdir}/$pkgname/po/es.po
	intltool-merge -d -u ${srcdir}/$pkgname/po ${srcdir}/$pkgname/$pkgname.desktop.in ${srcdir}/$pkgname/$pkgname.desktop
}

package() {
	mkdir -p ${pkgdir}/usr/share/locale/es/LC_MESSAGES/
	mkdir -p ${pkgdir}/usr/share/$pkgname/
	mkdir -p ${pkgdir}/usr/share/applications/
	
	cp ${srcdir}/locale/es/LC_MESSAGES/$pkgname.mo ${pkgdir}/usr/share/locale/es/LC_MESSAGES/$pkgname.mo
	cp ${srcdir}/$pkgname/$pkgname.desktop ${pkgdir}/usr/share/applications/
	cp ${srcdir}/$pkgname/$pkgname.ui ${pkgdir}/usr/share/$pkgname/
	cp ${srcdir}/$pkgname/$pkgname.pl ${pkgdir}/usr/share/$pkgname/
	cp ${srcdir}/$pkgname/$pkgname.png ${pkgdir}/usr/share/$pkgname/
}
