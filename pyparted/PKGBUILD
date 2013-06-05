# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Gökmen Görgen <gkmngrgn at gmail dot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst (at) gmail (dot) com>

pkgname=pyparted
pkgver=3.10
pkgrel=1
pkgdesc="Python module for GNU parted"
url="https://fedorahosted.org/pyparted"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2' 'parted>=3.0')
makedepends=('pkg-config')
conflicts=('pyparted-git')
source=(https://fedorahosted.org/releases/p/y/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('6189818baa0b1e9edf199eeced5242891534a700')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
