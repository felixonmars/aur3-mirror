# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

## Arch Linux themed gnome shell theme, and matching gtk3 theme and icon set.

pkgname=gnome-theme-archway
pkgver=3.6
pkgrel=1
pkgdesc="ArchWay Theme For the Gnome Shell and GTK3"
url="http://cbowman57.deviantart.com/art/Gnome-shell-3-6-theme-ArchWay-347656585"
arch=('any')
license=('cc-by-nc-sa-3.0')
depends=('')
optdepends=('gnome' 'gnome-extra' 'gnome-shell')
makedepends=('p7zip')
#noextract=(${source[@]%%::*})
source=("gnome_shell_3_6_theme__archway_by_cbowman57-d5qzhjd.7z")
md5sums=('7d039a645355c2cbf762433730efa611')
sha1sums=('378bda5ebd813dc1747cd61339ecb4e27e2dbf0b')

build() {
true 
}
 
package() {
    mkdir -p "${pkgdir}/usr/share/themes/"
    cp -afR "${srcdir}/ArchWay" "${pkgdir}/usr/share/themes/"
    mv "${pkgdir}/usr/share/themes/ArchWay/icons" "${pkgdir}/usr/share/"
}

# vim:set ts=2 sw=2 et:
