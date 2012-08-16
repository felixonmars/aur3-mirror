# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=timelimit
pkgver=1.8
pkgrel=1
pkgdesc='Executes a command and terminates the spawned process after a given time.'
arch=('i686' 'x86_64')
url='http://devel.ringlet.net/sysutils/timelimit/'
license=('custom')
depends=('glibc')
source=("http://devel.ringlet.net/sysutils/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'LICENSE')
md5sums=('ad106fc69c8cea5b440f94f42271bfcc'
         '84c214e4aad4e060a18998026a405bad')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr MANDIR=/usr/share/man/man DESTDIR="${pkgdir}" BINGRP=root MANGRP=root install
  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
