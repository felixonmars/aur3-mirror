# Maintainer: flan_suse <windows2linux AT zoho DOT com>
pkgname=xcursor-krakin
pkgver=20100218
pkgrel=1
pkgdesc="Futuristic cursor theme with fluid animations"
arch=('any')
url="http://gnome-look.org/content/show.php/Krakin?content=120403"
license=('GPL')
groups=()
depends=()
source=('http://gnome-look.org/CONTENT/content-files/120403-Krakin.tar.gz')
md5sums=('22443bfb0af7437568b6547365a54234')

build() {
    
    # Move into source directory
    cd "${srcdir}"

    # Create installation directories
    install -d -m755 "${pkgdir}/usr/share/icons/"

    # Install the cursor theme
    cp -rf "Krakin" "${pkgdir}/usr/share/icons/"

}


