# $Id: PKGBUILD,v 1.8 2006/05/22 20:14:44 uid1015 Exp $
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=libicq2000
pkgver=0.3.2
pkgrel=4
pkgdesc="An opensource library being developed to support the icq2000/2001 protocol"
arch=(i686 x86_64)
depends=('libsigc++' 'gtkmm')
options=('!libtool')
license=('lgpl')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
url="http://libicq2000.sourceforge.net/"
md5sums=('bab0e61b540258e54eb1c3695ac75f6e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make 
  make prefix=${pkgdir}/usr install
  }
