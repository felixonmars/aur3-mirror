# Maintainer: Benjamin Cremer <bc@benjamin-cremer.de>
# https://github.com/bcremer/pkgbuild/tree/master/php-qafooprofiler-git

pkgname=php-qafooprofiler-git
pkgver=r217.dfee40e
pkgrel=1
pkgdesc="Qafoo Profiler PHP Extension (git master version) (unofficial)"
arch=('i686' 'x86_64')
url="https://github.com/QafooLabs/php-profiler-extension"
license=('Apache')
depends=('php>=5.4.0')
makedepends=('php' 'git')
provides=('php-qafooprofiler')
conflicts=('php-qafooprofiler')
source=("git+https://github.com/QafooLabs/php-profiler-extension.git"
        "https://github.com/QafooLabs/profiler/releases/download/v1.3.0/QafooProfiler.php")
sha256sums=('SKIP'
         '8be18856a19cb789bab36c940863f90bd2ebb5406f826b0cae6301db90b4d389')

pkgver() {
    cd "$srcdir/php-profiler-extension"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/php-profiler-extension"
    phpize
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/php-profiler-extension"
    export NO_INTERACTION=1
    make test
    echo
}

package() {
    cd "$srcdir/php-profiler-extension"
    make INSTALL_ROOT="$pkgdir" install
    echo ';extension=qafooprofiler.so' > qafooprofiler.ini
    install -Dm644 ../QafooProfiler.php "$pkgdir/usr/lib/php/modules/QafooProfiler.php"
    install -Dm644 qafooprofiler.ini "$pkgdir/etc/php/conf.d/qafooprofiler.ini"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

