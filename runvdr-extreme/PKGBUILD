# Contributor: David Spicer <azleifel at gmail dot com>

pkgname=runvdr-extreme
pkgver=0.5.0
pkgrel=1
pkgdesc="A runvdr script for VDR"
arch=('any')
url="http://projects.vdr-developer.org/projects/runvdr-extreme"
license=('GPL')
depends=('bash' 'vdr')
makedepends=('perl')
backup=('etc/runvdr.conf')
options=(emptydirs)
source=(http://projects.vdr-developer.org/attachments/download/1536/${pkgname}-$pkgver.tar.xz
        ${pkgname}-$pkgver.conf
        ${pkgname}.service)
md5sums=('e993264e0ec439118b47689a27111128'
         '724dbfd5f17d86ef962e2986d12dd13b'
         '67a81304b4d7dd8177bccf7765789083')

package() {
  cd "${srcdir}/${pkgname}-$pkgver"

  install -d -m755 "${pkgdir}/etc/runvdr/conf.d"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/lib/systemd/system"
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/man/man5"
  install -d -m755 "${pkgdir}/usr/share/${pkgname}"

  install -m644 "${srcdir}/${pkgname}-$pkgver.conf" "${pkgdir}/etc/runvdr.conf"
  install -m644 skeleton.example "${pkgdir}/usr/share/${pkgname}"
  sed -i "s:^\#\!/bin/bash:\#\!/usr/bin/bash:" runvdr-conf.d
  install -m755 runvdr-conf.d "${pkgdir}/usr/bin"
  sed -i "s:^\#\!/bin/bash:\#\!/usr/bin/bash:" runvdr
  install -m755 runvdr "${pkgdir}/usr/bin"

  # Install systemd service file
  install -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/"

  # Install documents
  pod2man -s 5 -c runvdr -r runvdr runvdr.conf.pod > "${pkgdir}/usr/share/man/man5/runvdr.conf.5"
  for _file in README README.de HISTORY; do
    install -m644 ${_file} "${pkgdir}/usr/share/doc/${pkgname}/${_file}"
  done
}

