# Contributor: azleifel <azleifel at googlemail dot com>
# Maintainer: dongiovanni <dongiovanni at archlinux.de>

pkgname=hts-tvheadend
pkgver=2.12
pkgrel=1
pkgdesc="Combined DVB receiver, Digital Video Recorder and streaming server for Linux"
arch=('i686' 'x86_64')
url="http://www.lonelycoder.com/hts/"
license=('GPL3')
depends=('avahi')
makedepends=('gzip')
optdepends=('xmltv: For an alternative source of programme listings')
install=tvheadend.install
source=(http://www.lonelycoder.com/debian/dists/hts/main/source/${pkgname}_${pkgver}.tar.gz rc-tvheadend conf-tvheadend)
md5sums=('a2b5506ae52dc7338fca86f0df1291da'
         '58b08cf1849d4a24702bb988199d5dff'
         '582ec0146ffed0cb5a3409aeececc31e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --release
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # Installation has to be done manually
  install -D -m755 build.Linux/tvheadend ${pkgdir}/usr/bin/tvheadend 
  # Install rc-script and config
  install -D -m755 ${srcdir}/rc-tvheadend ${pkgdir}/etc/rc.d/tvheadend 
  install -D -m755 ${srcdir}/conf-tvheadend ${pkgdir}/etc/conf.d/tvheadend
  # Install manpage
  install -D -m644 man/tvheadend.1 ${pkgdir}/usr/share/man/man1/tvheadend.1
}