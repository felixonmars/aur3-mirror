# Maintainer: Jan Seifert <jan.seifert@firma.seznam.cz>

pkgname=libfastrpc
pkgver=3.2.8
pkgrel=1
pkgdesc="Seznam's Fast Remote Procedure Call library"
arch=('x86_64')
url="http://fastrpc.sourceforge.net/"
license=('LGPL')
depends=('zlib' 'libxml2' 'gcc-libs' 'xz')
source=("http://prdownloads.sourceforge.net/fastrpc/fastrpc-$pkgver.tar.bz2?download")
md5sums=('e9740f6f21ec883a59214677a2735702')

build() {
    cd $srcdir/fastrpc-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/fastrpc-$pkgver
    make install DESTDIR=$pkgdir
    install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
