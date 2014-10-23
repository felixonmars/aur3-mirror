# AUR package maintainer: 3V0LU710N <db_eee at yahoo dot com>

pkgname=nouvegnomegray-icon-theme
pkgver=20140821
pkgrel=1
pkgdesc="nouveGnomeGray is a gray icon set made for dark GTK themes."
arch=('any')
makedepends=('p7zip')
optdepends=('gnome-icon-theme: GNOME icon theme')
url="http://gnome-look.org/content/show.php/nouveGnome?content=125474"
license=('GPL')
source=('http://fc08.deviantart.net/fs71/f/2014/233/f/3/nouvegnomegray_by_tsujan-d4ytv8m.7z')
md5sums=('7ee27a4b17dd0d2981f7570a3f9a8f81')

build()
{
 echo "Building Package..."
}

package()
{
 cd "$srcdir"
 install -d "${pkgdir}/usr/share/icons/"
 cp -rf "nouveGnomeGray" "${pkgdir}/usr/share/icons/" || return 1
 find -type f -print0 | xargs -0 chmod 644
}
