# $Id: PKGBUILD,v 1.5 2006/10/01 07:45:41 ganja_guru Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=libidl
pkgver=0.6.8
pkgrel=2.1
pkgdesc="A front-end for CORBA 2.2 IDL and Netscape's XPIDL"
arch=(i686 x86_64)
license=('LGPL')
depends=('glib')
source=(http://andrewtv.org/libIDL/libIDL-$pkgver.tar.gz)
md5sums=('97e2da9229cdb0445719b6cf802c1782')
url="http://andrewtv.org/libIDL/"

build() {
  cd $startdir/src/libIDL-$pkgver
  #Arch64 fix --build/host
  ./configure --prefix=/usr --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
