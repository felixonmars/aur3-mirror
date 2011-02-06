# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: sda <sda00@himki.net>

pkgname=igmpproxy
pkgver=0.1
pkgrel=1
pkgdesc="igmpproxy is a simple multicast router for Linux only using the IGMP protocol"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/igmpproxy"
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/igmpproxy/igmpproxy-$pkgver.tar.gz"
        "igmpproxy.rc.d")
backup=("etc/igmpproxy.conf")

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  install -D -m755 $srcdir/$pkgname.rc.d $pkgdir/etc/rc.d/$pkgname
}

md5sums=('c56f41ec195bc1fe016369bf74efc5a1'
         'f32ad05cebe9956aa44f8ada8fff28ac')
