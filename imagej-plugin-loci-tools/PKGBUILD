# Contributor: Sergey Malkin <adresatt@gmail.com>

pkgname=imagej-plugin-loci-tools
pkgver=stable
pkgrel=1
pkgdesc='The Bio-Formats Importer plugin for ImageJ'
arch=(any)
url=http://loci.wisc.edu/bio-formats/imagej
license=(GPL)
depends=(imagej)
source=("http://loci.wisc.edu/files/software/loci_tools.jar")

build() {
    install -D -m 644 "$srcdir"/loci_tools.jar "$pkgdir"/usr/share/imagej/plugins/Input-Output/loci_tools.jar
}
md5sums=('2914600d36ce0c077526a0380b59f099')
