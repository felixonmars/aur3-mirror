# Maintainer: Benjamin Cremer <bc@benjamin-cremer.de>
# https://github.com/bcremer/pkgbuild/tree/master/php-qafooprofiler

pkgname=php-qafooprofiler
pkgver=1.3.7
pkgrel=1
pkgdesc="Qafoo Profiler PHP Extension (unofficial)"
arch=('i686' 'x86_64')
url="https://github.com/QafooLabs/php-profiler-extension"
license=('Apache')
depends=('php>=5.4.0')
makedepends=('php' 'git')
provides=('php-qafooprofiler')
conflicts=('php-qafooprofiler')
source=("https://github.com/QafooLabs/php-profiler-extension/archive/v$pkgver.tar.gz"
        "https://github.com/QafooLabs/profiler/releases/download/v1.3.5/QafooProfiler.php")
sha256sums=('a17a47fbad72fcf13752a70c102e2749afef5f133910921ca876136e6f783fdb'
            '91d79fef27180125e59fdeea8170ec748714fd6677b3f3d9241908c36d65e3a8')

build() {
    cd "$srcdir/php-profiler-extension-$pkgver"
    phpize
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/php-profiler-extension-$pkgver"
    export NO_INTERACTION=1
    make test
    echo
}

package() {
    cd "$srcdir/php-profiler-extension-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    echo ';extension=qafooprofiler.so' > qafooprofiler.ini
    install -Dm644 ../QafooProfiler.php "$pkgdir/usr/lib/php/modules/QafooProfiler.php"
    install -Dm644 qafooprofiler.ini "$pkgdir/etc/php/conf.d/qafooprofiler.ini"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

