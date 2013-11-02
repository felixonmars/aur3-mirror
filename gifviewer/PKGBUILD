pkgname=gifviewer
pkgver=1.0
pkgrel=3
pkgdesc="Simple animated gif viewer written in perl gtk2"
url="http://www.archlinux.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2-perl' 'perl-locale-gettext')
makedepends=('intltool' 'gettext')
groups=('multimedia')
install="$pkgname.install"
source=("https://www.dropbox.com/s/5v89tj9d9pmtw7x/gifviewer_src-1.0.0.tar.gz")
md5sums=('30e375283fea29f09b9e0d02a152f2b0')

package() {
	mkdir -p ${pkgdir}/usr/share/locale/es/LC_MESSAGES/
	mkdir -p ${pkgdir}/usr/share/$pkgname/
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${srcdir}/locale/es/LC_MESSAGES/
	msgfmt -c -v -o locale/es/LC_MESSAGES/$pkgname.mo ${srcdir}/GifViewer/po/es.po
	intltool-merge -d -u ${srcdir}/GifViewer/po ${srcdir}/GifViewer/$pkgname.desktop.in ${srcdir}/GifViewer/$pkgname.desktop
	
	cp ${srcdir}/locale/es/LC_MESSAGES/$pkgname.mo ${pkgdir}/usr/share/locale/es/LC_MESSAGES/$pkgname.mo
	cp ${srcdir}/GifViewer/$pkgname.desktop ${pkgdir}/usr/share/applications/
	cp ${srcdir}/GifViewer/$pkgname.ui ${pkgdir}/usr/share/$pkgname/
	cp ${srcdir}/GifViewer/$pkgname.pl ${pkgdir}/usr/share/$pkgname/
	cp ${srcdir}/GifViewer/$pkgname.png ${pkgdir}/usr/share/$pkgname/
	
}
