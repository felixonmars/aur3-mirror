pkgname=imagej-plugin-rats
pkgver=20091211
pkgrel=1
pkgdesc="ImageJ plugin for Robust Automatic Threshold Selection"
arch=(any)
url=http://rsbweb.nih.gov/ij/plugins/rats/
license=(unknown)
depends=(imagej)
source=("http://rsbweb.nih.gov/ij/plugins/rats/RATS_.jar")

build() {
    install -D -m 644 "$srcdir"/RATS_.jar "$pkgdir"/usr/share/imagej/plugins/RATS_.jar
}

md5sums=('49d7ae7951e3435390eb6095f260054f')
