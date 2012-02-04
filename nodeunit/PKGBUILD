#
pkgname=nodeunit
pkgver=git
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/caolan/nodeunit"
license="MIT"
source=(https://github.com/caolan/nodeunit/tarball/master)
md5sums=('2bae6401f6cf0441e126268c3db24b0f')

build() {
    cd $srcdir/caolan-nodeunit-b41facc
    mkdir -p $pkgdir/usr/local/bin
    mkdir $pkgdir/bin
    make
    make PREFIX=$pkgdir/usr/local install
    ln -s /usr/local/bin/nodeunit $pkgdir/bin
}
