# Maintainer: Valere Monseur <valere_monseur@hotmail.com>
# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>
# Contributor: Kevin Edmonds <edmondskevin@hotmail.com>

pkgname=conntrack-tools
pkgver=1.0.0
pkgrel=1
pkgdesc="Userspace tools to interact with the Netfilter's Connection Tracking System"
arch=('i686' 'x86_64')
url="http://www.netfilter.org/projects/conntrack-tools"
license=('GPL')
depends=(libnetfilter_conntrack)
source=(http://www.netfilter.org/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.bz2)
md5sums=('5add24d4761baf17af630d5627a71752')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # install binaries
  make DESTDIR=${pkgdir} install

  # install directories
  install -d ${pkgdir}/etc/conntrackd
  install -d ${pkgdir}/usr/share/doc/${pkgname}

  # install doc, default config and scripts
  cp -R ${srcdir}/${pkgname}-${pkgver}/doc/* ${pkgdir}/usr/share/doc/${pkgname}/

  # remove useless doc files
  rm ${pkgdir}/usr/share/doc/${pkgname}/manual/config.xsl \
     ${pkgdir}/usr/share/doc/${pkgname}/manual/conntrack-tools.tmpl \
     ${pkgdir}/usr/share/doc/${pkgname}/manual/docbook.css \
     ${pkgdir}/usr/share/doc/${pkgname}/manual/Makefile

  # set scripts executable
  chmod a+x ${pkgdir}/usr/share/doc/${pkgname}/debian.conntrackd.init.d \
            ${pkgdir}/usr/share/doc/${pkgname}/cli/test.sh \
            ${pkgdir}/usr/share/doc/${pkgname}/sync/primary-backup.sh

  # install license
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
