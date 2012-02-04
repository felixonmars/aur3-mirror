# Maintainer: Stephane Travostino <stephane.travostino@gmail.com>

pkgname=shareme
pkgver=1.0.2
pkgrel=3
pkgdesc="Folder sharing for dummies"
arch=('i686' 'x86_64')
url='http://combo.cc/shareme.html'
license=('GPL2')
depends=('python')
source=(http://dl.combo.cc/shareme-$pkgver.tar.gz shareme)

md5sums=('643108cbd614e3c2cdbcf103a7f71809'
         '58a9af7e9bb303cd36c27eaadf5ddb71')

build() {
    cd $startdir/src/shareme-$pkgver
    install -d $startdir/pkg/usr/share/shareme/pyftpdlib
    install -D -m 644 $startdir/src/shareme-$pkgver/* $startdir/pkg/usr/share/shareme/
    install -D -m 644 $startdir/src/shareme-$pkgver/pyftpdlib/* $startdir/pkg/usr/share/shareme/pyftpdlib
    install -D -m 755 $startdir/src/shareme $startdir/pkg/usr/bin/shareme
}

