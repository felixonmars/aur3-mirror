#Maintainer: lh<jarryson@gmail.com>

pkgname=client4rj
pkgver=0.4.2
pkgrel=s1
pkgdesc="QT4 client for ruijie 3.22 and blow"
arch=(i686)
url="http://www.linux-ren.org/modules/softstorage/show.php?content=140&forumpage=4"
license=('custom')
depends=('libnet' 'libpcap' 'qt')
source=($pkgname-$pkgver-$pkgrel.tar.gz $pkgname.desktop)
install=$pkgname.install
md5sums=('339a755ad31929fab5f1cc00e26ff7fc' 'e3cbe56e6be9ef66270102f6b1d9b560')


build() {
  cd $startdir/src/$pkgname-$pkgver

  qmake || return 1
  make || return 1

  mkdir -p $pkgdir/{usr/bin,/usr/share/applications}
  install -Dm755 client4rj $pkgdir/usr/bin/client4rj
  install -Dm755 $srcdir/client4rj.desktop $pkgdir/usr/share/applications/
}