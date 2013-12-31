# Maintainer: Sofia Lee <sofiamarielee@gmail.com>
pkgname=classic95-icon-theme
pkgver=0.8
pkgrel=1
pkgdesc="Classic icons for GNOME/MATE based on Windows 95."
url="http://gnome-look.org/content/show.php/Classic95?content=157298"
license=('GPL')
arch=('any')
depends=()
source=("http://sourceforge.net/projects/classic95-p/files/latest/download")
md5sums=('88b17a2b408d793e8f63f0d0c587d4ff')

package() {
    mkdir -p ${pkgdir}/usr/share/icons
    cp -raf ${srcdir}/Classic95* ${pkgdir}/usr/share/icons/
    chown -R root:root "${pkgdir}"/usr
}
