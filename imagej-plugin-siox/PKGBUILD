pkgname=imagej-plugin-siox
pkgver=20091207
pkgrel=1
pkgdesc='ImageJ plugin to segments RGB images. It is an ImageJ version of the Fiji plugin "SIOX: Simple Interactive Object Extraction".'
arch=(any)
url=http://rsb.info.nih.gov/ij/plugins/siox
license=(unknown)
depends=(imagej)
source=("http://rsb.info.nih.gov/ij/plugins/siox/siox_.jar")

build() {
    install -D -m 644 "$srcdir"/siox_.jar "$pkgdir"/usr/share/imagej/plugins/siox_.jar
}
md5sums=('769f351513b784e706a96f672cbf6308')
