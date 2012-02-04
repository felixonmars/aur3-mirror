pkgname=imagej-plugin-multithresholder
pkgver=20090414
pkgrel=1
pkgdesc="ImageJ plugin to segment the current image using any of the 15 thresholding methods"
arch=(any)
url=http://rsbweb.nih.gov/ij/plugins/multi-thresholder.html
license=(unknown)
depends=(imagej)
source=("http://rsbweb.nih.gov/ij/plugins/download/jars/Multi_Thresholder.jar")

build() {
    install -D -m 644 "$srcdir"/Multi_Thresholder.jar "$pkgdir"/usr/share/imagej/plugins/Multi_Thresholder.jar
}

md5sums=('93e5eec96cc2372e09010ef0d64695b1')
