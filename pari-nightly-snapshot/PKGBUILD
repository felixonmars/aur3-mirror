# Maintainer: Limao Luo <luolimao@gmail.com>

pkgname=pari-nightly-snapshot
pkgver=2.6
pkgrel=4
pkgdesc="Pari/GP: Computer algebra system designed for fast computations in number theory (nightly snapshot)"
arch=(i686 x86_64)
url='http://pari.math.u-bordeaux.fr/'
license=(GPL)
depends=(libx11)
makedepends=(texlive-core)
conflicts=(pari)
provides=(pari=$pkgver)

build() {
    cd $srcdir/
    wget -c "ftp://pari.math.u-bordeaux.fr/pub/pari/snapshots/pari-2.6*" -O $pkgname.tar.gz
    _name=$(tar tf $pkgname.tar.gz | head -1)

    rm -rf $pkgname/
    mkdir $pkgname/
    tar xf $pkgname.tar.gz --strip-components=1 -C $pkgname/
    cd $pkgname/

    sed 's:\$addlib64: :' -i config/get_libpth
    Configure --prefix=/usr --with-gmp --with-readline

    _corecount=$(grep -i processor /proc/cpuinfo | wc -l)
    make -j$_corecount all
}

check() {
    cd $srcdir/$pkgname/
    make -j$_corecount bench
}

package() {
    cd $srcdir/$pkgname/
    make DESTDIR=$pkgdir install

    # symlink pointing to a symlink that is going to be moved by zipman
    rm $pkgdir/usr/share/man/man1/pari.1
    ln -s gp.1.gz $pkgdir/usr/share/man/man1/pari.1.gz
}
