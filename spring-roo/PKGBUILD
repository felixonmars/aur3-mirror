# Maintainer: Romain Schmitz <slopjong@archlinux.lu>

pkgname=spring-roo
pkgver=1.2.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Spring Roo rapid application development tool"
url="http://www.springsource.org/roo"
license="('GPL 3')"
source=(http://s3.amazonaws.com/dist.springframework.org/release/ROO/spring-roo-${pkgver}.RELEASE.zip)
sha1sums=('1a1d27617d7029899dc96caa53b51a3b80d01d21')

build() {
:
}

package() {

  mkdir -p ${pkgdir}/{opt,usr/bin}
  mv ${srcdir}/${pkgname}-${pkgver}.RELEASE ${pkgdir}/opt/${pkgname}-${pkgver}
  chgrp -R users ${pkgdir}/opt/${pkgname}-${pkgver}
  chmod g+w ${pkgdir}/opt/${pkgname}-${pkgver}
  ln -s /opt/${pkgname}-${pkgver}/bin/roo.sh ${pkgdir}/usr/bin/roo
}

