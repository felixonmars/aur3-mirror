# $Id: PKGBUILD,v 1.2 2006/05/27 15:28:33 andyrtr Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=netkit-bootparamd
pkgver=0.17
pkgrel=1
pkgdesc="This is netkit-bootparamd for Linux"
arch=(i686 x86_64)
license=('custom')
depends=('glibc' 'portmap')
source=(ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/$pkgname-$pkgver.tar.gz)
md5sums=('00d211115b11aec2e214b701fe72f397')
url="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
build() {
cd $startdir/src/$pkgname-$pkgver
mkdir -p $startdir/pkg/usr/bin
mkdir -p $startdir/pkg/usr/man/man8
mkdir -p $startdir/pkg/usr/man/man1
mkdir -p $startdir/pkg/usr/sbin
./configure --prefix=$startdir/pkg/usr
make || return 1
make prefix=$startdir/pkg/usr install
install -d $startdir/pkg/usr/share/licenses/$pkgname/
head -15 rpc.bootparamd/README|tail -5 > $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}
