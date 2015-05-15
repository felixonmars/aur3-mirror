# Maintainer: kokakoda (kokakoda [at] gmail [dot] com)

pkgname=dropbear-zipit-bin
pkgver=2014.66
pkgrel=1
pkgdesc="Lightweight replacement for sshd"
arch=('armv5l')
url="http://matt.ucc.asn.au/dropbear/dropbear.html"
license=('MIT')
depends=('zlib')
source=(dropbear.service
        http://landley.net/aboriginal/downloads/binaries/extras/dropbearmulti-armv5l)
sha256sums=('1920dc2d9a1dd86b3137ae4348196f9b95142d6eee484ee536bc7dfed7f0def0'
            SKIP)

prepare() {
  chmod +x dropbearmulti-armv5l
  ln -s dropbearmulti-armv5l dropbear
  ln -s dropbearmulti-armv5l dbclient
  ln -s dropbearmulti-armv5l dropbearkey
  ln -s dropbearmulti-armv5l dropbearconvert
}

package() {
  # Configuration files
  install -D -m755 "${srcdir}/dropbearmulti-armv5l" "${pkgdir}/usr/bin/dropbearmulti-armv5l"
  install -D -m755 "${srcdir}/dropbear" "${pkgdir}/usr/bin/dropbear"
  install -D -m755 "${srcdir}/dbclient" "${pkgdir}/usr/bin/dbclient"
  install -D -m755 "${srcdir}/dropbearconvert" "${pkgdir}/usr/bin/dropbearconvert"
  install -D -m755 "${srcdir}/dropbearkey" "${pkgdir}/usr/bin/dropbearkey"
  install -d "${pkgdir}/etc/dropbear"
  install -D -m644 "${srcdir}/dropbear.service" "${pkgdir}/usr/lib/systemd/system/dropbear.service"
}

