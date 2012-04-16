# Maintainer: Alucryd <alucryd at gmail dot com>

pkgname='jgraphx-scilab'
pkgver='1.4.1.0'
pkgrel='3'
pkgdesc='Open source graph drawing component.'
arch=('any')
url='http://www.jgraph.com/jgraphx.html'
license=('BSD')
depends=('java-runtime')
makedepends=('apache-ant' 'java-environment')
provides=('jgraphx=1_4_1_0')
conflicts=('jgraphx')
source=("http://www.jgraph.com/downloads/jgraphx/archive/jgraphx-1_4_1_0.zip")
md5sums=('59513560e53b1e21dd583ee7a0abd23f')
 
build() {
    cd "$srcdir/jgraphx"
    /usr/share/java/apache-ant/bin/ant 
}

package() {
    cd "$srcdir/jgraphx"
    install -Dm644 lib/jgraphx.jar "$pkgdir/usr/share/java/jgraphx/jgraphx.jar"
    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
