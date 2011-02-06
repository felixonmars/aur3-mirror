# $Id: PKGBUILD 27489 2009-02-22 03:19:56Z eric $
# Contributor: John Proctor <jproctor@prium.net>
# Maintainer: Kevin Piche <kevin@archlinux.org>
#  ssax-sxml-bigloo071203.tgz
pkgname=ssax-sxml-bigloo
_pkgname=ssax-sxml
pkgver=3.4a
_pkgver=071203
pkgrel=1
pkgdesc="S-exp-based XML parsing/query/conversion suite for bigloo"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://ssax.sourceforge.net/"
depends=('bigloo')
source=( http://nchc.dl.sourceforge.net/project/ssax/ssax-sxml-bigloo/2007.12.03/ssax-sxml-bigloo071203.tgz)
build() {
  cd ${srcdir}/${_pkgname}
  cp $startdir/patch .
  patch Makefile patch
  make -j4 || return 1
  mkdir -p $pkgdir/usr/lib/bigloo/$pkgver
  cp lib*so lib*a $pkgdir/usr/lib/bigloo/$pkgver
  cd $pkgdir/usr/lib
  ln -s bigloo/$pkgver/* .
}
md5sums=(4741d89d9cda9798df64739b2f32b088)
