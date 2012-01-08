# Maintainer: Patrick Oberdorf <obi12341@googlemail.com> 
pkgname=simfy
pkgver=1.6.2
pkgrel=1
pkgdesc="Desktop application for simfy.de"
arch=('any')
url="http://www.simfy.de"
license=('Commercial')
depends=('adobe-air-sdk')
makedepends=('rpmextract')
optdepends=()
source=("${pkgname}-${pkgver}.zip::http://static.simfy.de/downloads/desktop/simfy_player.zip"
        simfy simfy.desktop)
md5sums=('6effc2c3fed124192dc874f2aee1653d'
        '9fe000cbbde815128278c8be014d62ee'
        'cd548d107652c8b5d18fb03b59e0d361')

build() {
  cd "${srcdir}"
  rpm2cpio "simfy_${pkgver}.rpm" | bsdtar -xf - -C "${pkgdir}"
  rm "${pkgdir}/opt/simfy/bin/simfy"
  rm -r "${pkgdir}/etc/opt"
  rmdir "${pkgdir}/etc"
  rm -r "${pkgdir}/usr/share"
  install -D -m755 simfy "${pkgdir}/usr/bin/simfy"
  install -D -m644 simfy.desktop "${pkgdir}/usr/share/applications/simfy.desktop"
}

# vim:set ts=2 sw=2 et:
