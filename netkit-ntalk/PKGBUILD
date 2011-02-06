# $Id: PKGBUILD,v 1.2 2006/05/27 15:31:34 andyrtr Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=netkit-ntalk
pkgver=0.17
pkgrel=2
pkgdesc="Network talk daemon"
arch=(i686 x86_64)
license=('BSD')
url="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
depends=('glibc' 'xinetd')
source=(ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/$pkgname-$pkgver.tar.gz talkd.patch ntalkd.xinetd)
md5sums=('e3c57208f8644ae206dab5e236daf7b3' 'a3646b129c0db479b839d1a58b618956'\
         '143d6b1fddf8b77d564aaebb297d1b7b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p0 -i $startdir/src/talkd.patch
  ./configure --prefix=/usr
  make || return 1
  mkdir -p $startdir/pkg/usr/{bin,sbin} $startdir/pkg/usr/man/man{1,8} $startdir/pkg/etc/xinetd.d
  install -m755 talk/talk $startdir/pkg/usr/bin
  install -m644 talk/talk.1 $startdir/pkg/usr/man/man1/
  install -m755 talkd/talkd $startdir/pkg/usr/sbin/in.talkd
  install -m644 talkd/talkd.8 $startdir/pkg/usr/man/man8
  install -m644 $startdir/src/ntalkd.xinetd $startdir/pkg/etc/xinetd.d/ntalkd
  install -d $startdir/pkg/usr/share/licenses/$pkgname
  head -32 talk/talk.c > $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}
