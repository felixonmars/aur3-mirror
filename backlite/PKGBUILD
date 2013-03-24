# Contributor: Otakar Haška <ota.haska@seznam.cz>
pkgname=backlite
pkgver=1.0.3
pkgrel=2
pkgdesc="A lite version of k9copy which can run without all the KDE stuff."
arch=('i686' x86_64)
url="http://downloads.sourceforge.net/k9copy/"
license=('GPL')
depends=('qt4' 'libmpeg2' 'phonon')
makedepends=(patch)
source=(http://downloads.sourceforge.net/k9copy/${pkgname}-${pkgver}.tar.gz \
	backlite-1.0.3-ffmpeg-0.11.patch \
	backlite-1.0.3-includepaths.patch)

build() {
 cd ${srcdir}
 patch -p0 < backlite-1.0.3-ffmpeg-0.11.patch || return 1
 patch -p0 < backlite-1.0.3-includepaths.patch || return 1
 cd "$srcdir/${pkgname}-${pkgver}"
 export QTDIR=/usr
 qmake-qt4 "PREFIX=${pkgdir}/usr" backlite.pro
 make || return 1
}

package()
{
 cd "$srcdir/${pkgname}-${pkgver}"
 make DESTDIR="${pkgdir}" install || return 1
}

md5sums=('167007b06ae0bfa402cbaf7201539bcb'
         'a01fdb18a557a00e2a20b4ad13991867'
         '7459d7d92cc20229eb997c64aab7ced1')
