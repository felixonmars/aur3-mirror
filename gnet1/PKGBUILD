# $Id: PKGBUILD,v 1.5 2006/05/21 20:20:54 uid1015 Exp $
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gnet1
pkgver=1.1.9
pkgrel=2
pkgdesc="GNet is a simple network library"
arch=(i686 x86_64)
depends=('glib')
license=('LGPL')
source=(http://gnetlibrary.org/src/gnet-$pkgver.tar.gz)
md5sums=('381b5c6d4031806fc4c3e6b28dc752ec')
url="http://www.gnetlibrary.org/"

build() {
    cd $startdir/src/gnet-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make prefix=$startdir/pkg/usr install
    find $startdir/pkg -name '*.la' -exec rm {} \;
}
