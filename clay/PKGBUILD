pkgname=clay
pkgver=0.1.2
_gitver=751ebe3
pkgrel=1
pkgdesc='Clay is a programming language designed for Generic Programming.'
arch=('i686' 'x86_64')
url='http://claylabs.com/clay/'
license=('BSD')
depends=('llvm=3.1' 'clang=3.1')
makedepends=('cmake>=2.6')
conflicts=('clay-hg' 'clay-git')
source=(https://github.com/jckarter/$pkgname/tarball/v$pkgver/jckarter-$pkgname-v$pkgver-0-g$_gitver.tar.gz)
sha256sums=('fdb460383c3dbed14cbcd9b2687d6120215e539fa87840fd5247ba599903f857')

build() {
    cd $srcdir/jckarter-$pkgname-$_gitver

    mkdir build
    cd build
    cmake -G "Unix Makefiles" ../ -DCMAKE_INSTALL_PREFIX=/usr

    make DESTDIR=$pkgdir install
}
