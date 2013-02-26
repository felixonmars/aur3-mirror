#! /bin/bash
# Contributor: xnitropl <xnitropl at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Maintainer: jorge_barroso <jorge.barroso.11@gmail.com>

pkgname=7kaa-data
pkgver=2.14.4
pkgrel=1
pkgdesc="Free data set for Seven Kingdoms: Ancient Adversaries"
url='http://7kfans.com/'
projecturl=http://sourceforge.net/projects/skfans
arch=('any')
license=('GPL2')
source=("${projecturl}/files/7KAA%20${pkgver}/7kaa-source-${pkgver}.tar.bz2/download")
sha512sums=('7ee39aba89993d9f0041ab991e053069e0c3ab4298f74c0ec95e3f30f49a71731ef37d8870b1ab9afd97b1c4618a879492976006b8a513bfc4bc44dfac591bf0')



package() {
  # install data files
  install -dm755 "${pkgdir}/opt/7kaa/"
  cd "${srcdir}/7kaa/"
  cp -r {encyc,encyc2,image,resource,scenari2,scenario,sound,sprite,tutorial} "${pkgdir}/opt/7kaa/"

  # fix permissions
  cd "${pkgdir}/opt/7kaa/"
  find . -type d -exec chmod 755 {} \;

  # copy readme
  install -D -m644 "${srcdir}/7kaa/README-GameData" "${pkgdir}/usr/share/doc/7kaa/README-GameData"
}

# vim:set ts=2 sw=2 et:
