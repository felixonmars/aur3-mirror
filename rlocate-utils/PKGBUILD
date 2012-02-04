# $Id: PKGBUILD,v 1.3 2008/06/17 07:50:29 BaSh dead $
# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: Tom K <tom@archlinux.org>

pkgname=rlocate-utils
pkgver=0.5.6
pkgrel=2
pkgdesc="An implementation of the locate command that is always up-to-date"
arch=('i686' 'x86_64')
url="http://rlocate.sourceforge.net/"
license=('GPL')
provides=('slocate')
conflicts=('slocate' 'mlocate')
depends=('glibc')
backup=('etc/updatedb.conf' 'var/lib/rlocate/rlocate.db')
install=rlocate-utils.install
source=(http://downloads.sourceforge.net/rlocate/rlocate-$pkgver.tar.gz \
	nogrp_nomod.patch rlocate.rc updatedb.conf)
md5sums=('b834e2b1249fba9138bea29a030de46c'
         'ec682b8580e077e4d7a2faf2f7ab6c8e'
         'a25b18e9f10e1ce087d73ce6bd5a7bcb'
         '157fe15238ca807d0c37e6b2e8fdf439')

build() {
  cd $startdir/src/rlocate-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var/lib \
    --with-rlocate-group=locate

  patch -Np1 -i ../../nogrp_nomod.patch

  make || return 1
  make DESTDIR=$startdir/pkg install
  install -Dm755 ../rlocate.rc $startdir/pkg/etc/rc.d/rlocate
  install -Dm644 ../updatedb.conf $startdir/pkg/etc/updatedb.conf
}
