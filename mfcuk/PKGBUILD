# Maintainer: Pascal E. <archlinux at hardfalcon dot net>
# Contributor: Andrej Gelenberg <andrej.gelenberg at udo dot edu>
pkgname=mfcuk
pkgver=0.3.8
pkgrel=1
pkgdesc="MIFARE Classic Universal toolKit (MFCUK)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/mfcuk/"
license=('GPL2')
depends=("libnfc>=1.7.0")
source=("http://mfcuk.googlecode.com/files/$pkgname-$pkgver.tar.gz")

sha1sums=('2a8259440ac5bed8516c8d771a945b713dacd2bc')

build()
{
 cd $srcdir/$pkgname-$pkgver || return 1
 ./configure --prefix=/usr || return 1
 sed -i 's/"\.\/data\//"\/usr\/share\/mfcuk\/data\//g' src/mfcuk_finger.c
 make || return 1
}

package() {
 cd $srcdir/$pkgname-$pkgver || return 1
 make DESTDIR=$pkgdir install || return 1
# pwd
# echo install -D src/bin/data $pkgdir/usr/share/mfcuk/data
# install -dm0755 $pkgdir/usr/share/mfcuk/data/tmpls_fingerprints
# install -Dm0644 src/bin/data/tmpls_fingerprints/* $pkgdir/usr/share/mfcuk/data/tmpls_fingerprints/
}
