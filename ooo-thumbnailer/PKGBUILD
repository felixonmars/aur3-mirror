# Maintainer: max.bra <max.bra at alice dot it>
# Contributor: max.bra <max.bra at alice dot it>

pkgname=ooo-thumbnailer
pkgver=0.2
pkgrel=6
pkgdesc="ooo-thumbnailer is a lightweight LibreOffice.org document thumbnailer that can be used by Nautilus to create thumbnails for your documents"
arch=('any')
url="http://packages.debian.org/sid/ooo-thumbnailer"
license=('GPL')
depends=('imagemagick' 'unzip')
makedepends=()
optdepends=()
conflicts=('ooo-thumbnailer-unofficial')
source=(http://ftp.de.debian.org/debian/pool/main/o/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz ooo-thumbnailer.thumbnailer path_with_spaces_and_icons.patch)
md5sums=('441b3280fdb69be029f81d2b3036b6d0' '9165c91c960afd2a97126c70873841a7' '2137df07d7a0f99a38e8223397eab90c')

build() {
    patch -p1 < path_with_spaces_and_icons.patch
}

package() {
    install -D -m755 "${srcdir}"/${pkgname}-${pkgver}/$pkgname "${pkgdir}"/usr/bin/$pkgname
    
    # gnome 3 new thumbnailer
    install -D -m644 "${srcdir}"/ooo-thumbnailer.thumbnailer "${pkgdir}"/usr/share/thumbnailers/ooo-thumbnailer.thumbnailer
}
