# Contributor: Wei Qiu wei [at] qiu. [dot] es
# Contributor: Andreas W. Hauser
# Contributor: Benoit Favre

pkgname=crfpp-python2
pkgver=0.57
pkgrel=2
pkgdesc="A Conditional Random Field implementation with python2 interface"
provides="crfpp"
url="http://crfpp.sourceforge.net"
arch=(x86_64 i686)
license=(LGPL BSD)
depends=(python2)
source=(http://crfpp.googlecode.com/files/CRF%2B%2B-${pkgver}.tar.gz)

build() {
  cd $startdir/src/CRF++-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  cd python
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  python2 setup.py build
  python2 setup.py install --prefix=$startdir/pkg
}
md5sums=('efec88b501fecb0a72dd94caffb56294')
