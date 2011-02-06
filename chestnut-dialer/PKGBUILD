# $Id: $
# Maintainer: Paulo Matias <matiasΘarchlinux-br·org>

pkgname="chestnut-dialer"
pkgver="0.3.3"
pkgrel=2
pkgdesc="PPP dialing program"
arch=('i686' 'x86_64')
url="http://chestnut-dialer.sourceforge.net"
license=('GPL')
depends=('python' 'ppp' 'libxml2')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('fa61c704414ba0157e205fb52d1d5892')

optdepends=('pygtk: for GTK GUI'
            'pyqt3: for Qt GUI')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	rm po/pt_BR*  # Bad translation
	./configure --prefix=/usr --mandir=/usr/share/man || return 1
	make || return 1
	make install DESTDIR="${pkgdir}" || return 1
}

