# Contributer: Vinzenz Vietzke <vinz@archlinux.us>
pkgname=encode2mpeg
pkgver=0.6.4
pkgrel=1
pkgdesc="A frontend to MPlayer/MEncoder and mjpegtools"
arch=(i686)
url="http://encode2mpeg.sourceforge.net/encode2mpeg.html"
license=('GPL')
depends=('mplayer' 'mjpegtools')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b1c919204a063dbdb38cea1091c9be67')

build() {
  install -D -m0755 ${startdir}/src/${pkgname}-${pkgver}/encode2mpeg \
    ${startdir}/pkg/usr/bin/encode2mpeg
  install -D -m0755 ${startdir}/src/${pkgname}-${pkgver}/mountdvdraid \
    ${startdir}/pkg/usr/bin/mountdvdraid
}
