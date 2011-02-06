# Contributor: Archie <xMickael@ifrance.com>

pkgname=desktop-data-manager
pkgver=0.8.11
pkgrel=2
pkgdesc="desktop-data-manager includes a clipboard history for many different types of content (text, images, ...), an application to take screenshots from a single window/subwindow, rectangle of the screen or the whole desktop and a download manager."
arch=('i686' 'x86_64')
depends=('mono' 'gnome-sharp')
license=('GPL')
source=("http://downloads.sourceforge.net/data-manager/${pkgname}_${pkgver}_src.tar.gz")
url="http://data-manager.sourceforge.net"
md5sums=('9ed9338eff5b2735d814959a086b8a1d')

build() {
	export MONO_SHARED_DIR="${startdir}/src/.wabi"
	install -d "${MONO_SHARED_DIR}"

	cd ${startdir}/src/DesktopDataManager
	./configure --prefix=/usr
	make || return 1
	make prefix=$startdir/pkg/usr install
}

