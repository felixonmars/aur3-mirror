# Maintainer: scorici <scorici AT yahoo DOT com>

pkgname=gnomish-gray-theme
pkgver=20140505
pkgrel=1
pkgdesc="GnomishGray is a silver gray theme for GTK3 and GTK2. It is based on Adwaita, the default GTK engine of GNOME."
arch=('any')
url="http://tsujan.deviantart.com/art/GnomishGray-301188313"
#url="http://gnome-look.org/content/show.php?content=149193"
license=('GPL')
source=('http://fc08.deviantart.net/fs71/f/2014/125/c/4/gnomishgray_by_tsujan-d4zbie1.7z')


md5sums=('ba175237d2513ce9cba1bcd46f48b57e')
depends=('gtk-engine-murrine')
makedepends=('p7zip')
optdepends=('gnome-themes-standard: Default themes for the GNOME desktop' \
'gnome-tweak-tool: A tool to customize advanced GNOME 3 options')

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/usr/share/themes
  cp -rf GnomishGray "${pkgdir}"/usr/share/themes/
  chmod 755 -R "$pkgdir/usr/share/themes"
}
