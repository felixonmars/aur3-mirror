# $Id$
# Maintainer: Tinh Truong < xuantinh at gmail >

pkgname=mongodb-mem
pkgver=2.0.4
pkgrel=1
pkgdesc='A custom startup script and configuration for Mongodb to store data on /tmp'
arch=('i686' 'x86_64')
url='http://www.mongodb.org'
license=('AGPL3')
depends=('mongodb')
#checkdepends=('python2-pymongo')
backup=('etc/mongodb-mem.conf')
source=('mongodb.rc'
        'mongodb.conf')
md5sums=('bd151615670fa90f5d94cd7b2a53fb7c'
         '97549533e2fb8b381ad39ba0d08d600d')

build() {
  install -D -m755 ${srcdir}/mongodb.rc \
    ${pkgdir}/etc/rc.d/mongodb-mem
  install -D -m644 ${srcdir}/mongodb.conf \
    ${pkgdir}/etc/mongodb-mem.conf

  if [ -d ${pkgdir}/usr/lib64 ]; then
    mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
  fi
}
