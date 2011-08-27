pkgname=imagej-plugin-colocalization-colormap
pkgver=20100904
pkgrel=1
pkgdesc="Colocalization Colormap Plugin for ImageJ"
arch=(any)
url="http://sites.google.com/site/colocalizationcolormap"
license=(unknown)
depends=(imagej)
source=(http://sites.google.com/site/colocalizationcolormap/ColocalizationColormap.zip)

build() {
    install -D -m 644 "$srcdir"/ColocalizationColormap/ColocalizationColormap_.jar  \
	"$pkgdir"/usr/share/imagej/plugins/ColocalizationColormap_.jar
}

md5sums=('c5c681f7ef5a86d66b30ffc7f29dd8e6')
