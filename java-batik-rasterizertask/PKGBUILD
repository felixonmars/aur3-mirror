pkgname=java-batik-rasterizertask
pkgver=1.7
pkgrel=8
pkgdesc="RasterizerTask jar for Batik"
arch=('any')
url="http://xmlgraphics.apache.org/batik/"
license=(APACHE)
depends=('java-batik')
makedepends=('java-environment' 'apache-ant' 'unzip')
source=('http://apache.cict.fr/xmlgraphics/batik/batik-src-1.7.zip')
md5sums=('c117ca2241907f62a2b3031167ebf917')

build() {
        cd $srcdir/batik-$pkgver/contrib/rasterizertask
        ant -lib /usr/share/java/batik/batik-all.jar compile
        ant jar
}
package() {
        install -d $pkgdir/usr/share/java/batik
        install --mode=644 \
          $srcdir/batik-$pkgver/contrib/rasterizertask/build/lib/RasterizerTask.jar \
          $pkgdir/usr/share/java/batik/RasterizerTask.jar
}

