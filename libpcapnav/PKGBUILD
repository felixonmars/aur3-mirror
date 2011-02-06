# $Id: PKGBUILD,v 1.8 2007/10/07 06:34:39 tpowa Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=libpcapnav
pkgver=0.8
pkgrel=2
pkgdesc="Netdude is the NETwork DUmp data Displayer and Editor for tcpdump tracefiles"
arch=(i686 x86_64)
license=('BSD')
depends=('libpcap>=0.9.8')
source=(http://downloads.sourceforge.net/netdude/$pkgname-$pkgver.tar.gz)
md5sums=('005a0a2d6f1164f1212a7c10ab950b36')
url="http://netdude.sourceforge.net/"

build() {
   cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make prefix=$startdir/pkg/usr install
    find $startdir/pkg -name '*\.la' -exec rm -f {} \;
    install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
