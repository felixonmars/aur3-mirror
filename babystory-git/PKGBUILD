# PKGBUILD for babystory made by Liulang
# Contributor:MJsaka <qiuxuenan@gmail.com>
# Copyright
# This PKGBUILD published with the GPLv3 license

pkgname=babystory-git
pkgver=1.3
pkgrel=1
pkgdesc='A stuff telling stories and singing songs to your baby'
arch=('any')
license=('GPL3')
url="https://github.com/LiuLang/babystory"
depends=('python>=3.3' 'python-gobject' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gnome-icon-theme-symbolic')
optdepends=('python-mutagenx:convert ID3 tag from GBK to UTF-8')
source=("https://pypi.python.org/packages/source/b/babystory/${pkgname}-${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir"
}
