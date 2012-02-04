# Maintainer: Vladimir Ermakov <vooon341@gmail.com>

pkgname=tklor
pkgver=1.1.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A tool for reading the LOR"
license=('GPL')
depends=('tcl' 'tk' 'tcllib')
source=(http://tklor.googlecode.com/files/tklor_$pkgver-1.tar.gz)
url="http://code.google.com/p/tklor/"
md5sums=('fd7ef35a6442b2fc2f6e895db0134993')

build() {
        mkdir -p $startdir/pkg/usr/share/doc/tkLOR/examples/
        mkdir -p $startdir/pkg/usr/share/pixmaps/
        mkdir -p $startdir/pkg/usr/share/applications/
        mkdir -p $startdir/pkg/usr/lib/tkLOR/
        mkdir -p $startdir/pkg/usr/lib/tkLOR/msgs/
        mkdir -p $startdir/pkg/usr/bin/

        cp $startdir/src/$pkgname-$pkgver/lib/*.tcl $startdir/pkg/usr/lib/tkLOR/
        cp $startdir/src/$pkgname-$pkgver/lib/msgs/*.msg $startdir/pkg/usr/lib/tkLOR/msgs/
        cp $startdir/src/$pkgname-$pkgver/{README,UPGRADE} $startdir/pkg/usr/share/doc/tkLOR/
        cp $startdir/src/$pkgname-$pkgver/userConfig $startdir/pkg/usr/share/doc/tkLOR/examples/
        cp $startdir/src/$pkgname-$pkgver/config $startdir/pkg/usr/share/doc/tkLOR/examples/
        cp $startdir/src/$pkgname-$pkgver/tklor.xpm $startdir/pkg/usr/share/pixmaps/
        cp $startdir/src/$pkgname-$pkgver/tklor.desktop $startdir/pkg/usr/share/applications/
        cp $startdir/src/$pkgname-$pkgver/tkLOR $startdir/pkg/usr/bin/

        chmod -R 755 $startdir/pkg/
        chmod +x $startdir/pkg/usr/bin/tkLOR
        chmod +x $startdir/pkg/usr/lib/tkLOR/lorBackend.tcl
}
