# $Id: PKGBUILD 43020 2011-03-23 21:31:21Z kchen $
# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at

pkgname=duplicity-latest
_pkgname=duplicity
pkgver=0.6.15
pkgrel=1
pkgdesc='A utility for encrypted, bandwidth-efficient backups using the rsync algorithm'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/duplicity/'
provides=("duplicity=$pkgver")
conflicts=('duplicity')
license=('GPL')
depends=('librsync' 'ncftp' 'python2' 'python-boto' 'python-gnupginterface')
source=("http://savannah.nongnu.org/download/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('88f3c990f41fde86cd7d5af5a1bc7b81')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="$pkgdir" --optimize=1
}
