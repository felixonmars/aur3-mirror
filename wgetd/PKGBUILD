# Contributor: Simonenko Sergey <gforgx@lavabit.com>

pkgname=wgetd
pkgver=0.1
pkgrel=1
pkgdesc="Download daemon that uses wget"
url="http://notefinder.co.cc/wgetd"
arch=(i686 x86_64)
depends=(bash wget)
license=('Public Domain')
source=(http://notefinder.co.cc/files/$pkgname-$pkgver.tar.gz
        wgetd wgetd.conf)
md5sums=('c83f72e2b80dcff0476e46fdd01b3633'\
	'92a00d6a8458e315107e334d96c284ab'\
	'384f685d7a0ebff1e19cafe4ddd4e41e')


build() {
  cd $startdir/src/$pkgname-$pkgver

  install -D -m755 -o root -g root $srcdir/wgetd $pkgdir/etc/rc.d/wgetd
  install -D -m644 -o root -g root $srcdir/wgetd.conf $pkgdir/etc/wgetd.conf
  install -D -m755 -o root -g root $srcdir/$pkgname-$pkgver/wgetd $pkgdir/usr/bin/wgetd
  install -D -m755 -o root -g root $srcdir/$pkgname-$pkgver/wgetadd $pkgdir/usr/bin/wgetadd
  
}
