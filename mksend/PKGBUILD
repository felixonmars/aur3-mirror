# Contributor: catwell <catwell@archlinux.us>

pkgname=mksend
pkgver=0.5.6
pkgrel=1
pkgdesc="Tool to redirect, modify and send frames from a traffic active link."
arch=('i686' 'x86_64')
url="http://nopcode.org/wk.php/mksend"
license=('GPL')
source=(http://news.nopcode.org/pvcroot/$pkgname-$pkgver.tar.gz)
md5sums=(41a61c22cd3dcaa3a187df4618720b78)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  install -d $pkgdir/usr/share/mksend/db $pkgdir/usr/share/mksend/scripts \
    $pkgdir/var/db/mksend
  install -m0644 db/*.xml $pkgdir/usr/share/mksend/db/
  install -m0755 scripts/*.sh $pkgdir/usr/share/mksend/scripts/
  install -Ds src/mksend $pkgdir/usr/sbin/mksend
  install -Ds pcaptool/pcaptool $pkgdir/usr/bin/pcaptool
  install -Dm0444 doc/man/man1/pcaptool.1 $pkgdir/usr/share/man/man1/pcaptool.1
}

