# Contributor: Emanuele Rossi <newdna1510@yahoo.it>
# Mantainer: Sergio Jovani <lesergi@gmail.com>

pkgname=elltube
pkgver=0.3
pkgrel=1
pkgdesc="Elltube is a YouTube Downloader and Converter."
arch=('i686' 'x86_64')
url="http://elltube.sourceforge.net"
license=('GPL')
depends=('qt' 'pyqt' 'ffmpeg')
provides=('elltube')
source=(http://downloads.sourceforge.net/elltube/elltube-${pkgver}.tar.bz2)
md5sums=('204226cd0ae3092d88d065126e7b9496')


build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR=${startdir}/pkg/ install
}
