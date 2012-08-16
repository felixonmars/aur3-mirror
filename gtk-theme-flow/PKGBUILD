# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Maintainer: Lucas Saliés Brum <sistematico@gmail.com>

pkgname=gtk-theme-flow
pkgver=2.0
pkgrel=3
pkgdesc="GTK theme for the GNOME-Colors icon set, based on Shiki"
arch=(any)
url="http://gnome-look.org/content/show.php/Flow?content=124681"
license=('GPL')
depends=('gtk-engine-murrine>=0.98.1.1')
source=(http://gnome-look.org/CONTENT/content-files/124681-Flow.tgz)
md5sums=('a7e5de0c6dde148bf6d2ff91eaf2128a')

build() {
  true # STUB
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/themes"
    cp -r Flow-* "$pkgdir/usr/share/themes"
}
