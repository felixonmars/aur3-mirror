#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: damir <damir at archlinux dot org>
# Contributor: Elia Yehuda <z4ziggy at user-contributions dot org>
# Contributor: Aurélien DESBRIÈRES <ice dot cube at gmx dot com>

pkgname=ddcxinfo-arch
pkgver=0.8
pkgrel=4
pkgdesc="Utility to probe non/ddc monitors - used by hwd"
arch=('i686' 'x86_64')
url="http://user-contributions.org/projects/ddcxinfo-arch/"
license=('LGPL2')
depends=('glibc' 'libx86')
source=(http://user-contributions.org/projects/ddcxinfo-arch/source/${pkgname}-${pkgver}.tar.gz lrmi-vm86.patch)
sha512sums=('e32964acb42618eee652bf3284398daef032214b31543d82c761c72ca39dea45f02dd2d9034fc8f306fdb1807a35b6bb683d704bd0edfa893d32d1144eac0451'
            'f7ab25000c0da56947cb9e362178e6a35cf0653586f365e66c621b72196ef8ec2b262d417fa97228c4a63edcbfe26bc285597a51a1d902bc8c49a2031abc0fb6')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../lrmi-vm86.patch
}

build() {
  cd ${pkgname}-${pkgver}
  make ddcxinfo-arch
}

package() {
  cd ${pkgname}-${pkgver}
  install -D -m755 ddcxinfo-arch ${pkgdir}/usr/bin/ddcxinfo-arch
}