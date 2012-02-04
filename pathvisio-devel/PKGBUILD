# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=pathvisio-devel
pkgver=3.0.beta2
_pkgver=r3671
pkgrel=1
pkgdesc='Pathway visualization tool'
arch=('any')
url=('http://www.pathvisio.org/')
license=('LGPL')
makedepends=('jdk6' 'apache-ant')
depends=('java-runtime')
conflicts=('pathvisio')
provides=('pathvisio')
source=("http://www.pathvisio.org/data/releases/$pkgver/pathvisio_src-$pkgver-$_pkgver.tar.gz" "launcher.sh")
md5sums=('ed7e12e411315e344b2522d6d50616c1'
         '3f1e758588794b6190831642cb52afb5')

build() {
    cd "$srcdir"
    cd 'pathvisio-${pathvisio.version}'
    ant
}

package() {
    cd "$srcdir"
    install -Dm755 pathvisio.sh "$pkgdir/usr/bin/pathvisio"
    cd 'pathvisio-${pathvisio.version}'
    install -Dm755 pathvisio.jar "$pkgdir/usr/share/java/pathvisio.jar"
}
