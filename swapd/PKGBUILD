# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=swapd
pkgver=1.0.3
pkgrel=1
pkgdesc="Watches free memory and manages swap files"
url="http://www.rkeene.org/oss/swapd/"
license=""
depends=('glibc')
makedepends=()
conflicts=()
replaces=()
backup=()
arch=('i686')
install=
source=(http://www.rkeene.org/files/oss/swapd/source/$pkgname-$pkgver.tar.gz 
	swapd.init swapd.runit)
md5sums=('cb9ec64a5abd4535b95ec59311114ade' '5c0c337e2b8c88aac9cc37a8f8e9fe91'\
         '073a5ee85f77dd91a380bacdeff04e60')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/
  make || return 1
  install -d $startdir/pkg/usr/man/{man5,man8}
  install -d $startdir/pkg/etc/rc.d
  install -d $startdir/pkg/usr/sbin
  
  install -m 0755 swapd $startdir/pkg/usr/sbin
  install -m 0644 swapd.8 $startdir/pkg/usr/man/man8
  install -m 0644 swapd.conf.5 $startdir/pkg/usr/man/man5
  
  install -m 0644 swapd.conf $startdir/pkg/etc
  install -m 0755 ../swapd.init $startdir/pkg/etc/rc.d/swapd
  
  install -d $startdir/pkg/etc/sv/swapd
  install -m 0755 ../swapd.runit $startdir/pkg/etc/sv/swapd/run
}
