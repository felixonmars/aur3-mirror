#Maintainer: lh<jarryson@gmail.com>

pkgname=mystar
pkgver=0.11
pkgrel=1
pkgdesc="Client for ruijie 3.22 and blow"
arch=(i686)
url="http://www.ruijie.com.cn/" ##must have a value, but i dont know where the main page of mystar
license=('custom')
depends=('libnet' 'libpcap')
source=("$pkgname-$pkgver-src.tar.gz" 'mystar.rc')
install=mystar.install
md5sums=('da249a1559891f21d8538a61dabdfae0' 'f89e3c98f8c060593f60d1fc0f67a5a0')


build() {
  cd $startdir/src/"mystarV0.11-src(3.22)"

  make || return 1

  mkdir -p $pkgdir/{etc/rc.d,usr/bin}
  install -Dm644 mystar.conf $pkgdir/etc/mystar.conf
  install -Dm755 mystar $pkgdir/usr/bin/mystar
  install -Dm755 $srcdir/mystar.rc $pkgdir/etc/rc.d/mystar
}