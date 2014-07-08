pkgname=rlfe
pkgver=6.3
pkgrel=3
pkgdesc='A "universal wrapper" around readline.'
arch=('i686' 'x86_64')
url='http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html'
license='GPL3'
depends=('readline>=6.3' 'readline<6.4')
source=("http://ftp.gnu.org/gnu/readline/readline-$pkgver.tar.gz")
md5sums=('33c8fb279e981274f485fd91da77e94a')
sha256sums=('56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43')

build() {
    cd readline-$pkgver/examples/rlfe/
    ./configure --prefix=/usr
    make
}

package() {
    cd readline-$pkgver/examples/rlfe/
    mkdir -p $pkgdir/usr/bin/
    cp rlfe $pkgdir/usr/bin/
}
