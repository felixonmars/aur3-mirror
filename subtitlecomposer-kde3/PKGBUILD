# Contributor: David Watzke <david@watzke.cz>

pkgname=subtitlecomposer-kde3
_realname=subtitlecomposer
pkgver=0.4.3
pkgrel=3
pkgdesc="A KDE3 subtitle editor"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/subcomposer"
license=('GPL')
depends=('kdelibs3' 'xine-lib' 'gstreamer0.10-base' 'gettext')
optdepends=("mplayer: for MPlayer backend")
source=(http://downloads.sourceforge.net/subcomposer/${_realname}-${pkgver}.tar.bz2
        subtitlecomposer-build-fixes.patch)
sha256sums=('9a39aac7b666eb67137c99f9f8885481f8a005cb04df14a071bf5c763d98c2b4'
            '173e26abc85133e7a31a9e152520cfb4c890884cdaa9351f83cf63c28c15765f')

build() {
	cd "${srcdir}/${_realname}-${pkgver}"

	sed -i "/^Exec=/ s:=:=/opt/kde/bin/:" src/main/subtitlecomposer.desktop
	sed -i "s/-fno-exceptions/-fexceptions/g" configure
	patch -Np1 -i "${srcdir}/subtitlecomposer-build-fixes.patch"

	QTDIR=/opt/qt ./configure --without-arts --prefix=/opt/kde
	make
}

package() {
	cd "${srcdir}/${_realname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
