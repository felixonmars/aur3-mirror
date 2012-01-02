# Maintainer: schalox <schalox at gmail dot com>
pkgname=gtk-theme-simply-basic
pkgver=02012012
pkgrel=1
pkgdesc="A simple gtk-theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Simply+Basic?content=126587"
license=('Artistic2.0')
depends=('gtk-engine-murrine')
source=('http://gnome-look.org/CONTENT/content-files/126587-126587-Simply%20Basic.tar.gz')
sha256sums=('243a325d5e382050380f57b7b14df72aedc103fa25260ef96c9e9cbc20e6faea')

build() {
    install -d -m755 "$pkgdir"/usr/share/themes/
}

package() {
    cd "$srcdir"
    cp -r "Simply Basic Zero Border" "Simply Basic" "$pkgdir"/usr/share/themes/
}
