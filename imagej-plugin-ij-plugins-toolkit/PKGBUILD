pkgname=imagej-plugin-ij-plugins-toolkit
pkgver=1.5.2_r1213
pkgrel=1
pkgdesc="The ImageJ Plugins project is a source of custom plugins for the ImageJ software package"
arch=(any)
url=http://ij-plugins.sourceforge.net
license=(GPL)
depends=(imagej)
source=("http://ovh.dl.sourceforge.net/project/ij-plugins/ij-plugins_toolkit/v.${pkgver%_*}/ij-plugins_toolkit_bin_${pkgver}.zip")

build() {
    install -D -m 644 "$srcdir"/ij-plugins_toolkit.jar "$pkgdir"/usr/share/imagej/plugins/ij-plugins_toolkit.jar
}

md5sums=('c03624ece95fc68594e28d4b1faf26be')
