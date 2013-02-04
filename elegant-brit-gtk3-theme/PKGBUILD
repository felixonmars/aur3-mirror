# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=elegant-brit-gtk3-theme
pkgver=20130204
pkgrel=2
pkgdesc="This is the Elegant Brit gtk theme ported to gtk3. Includes gtk2, gtk3, Metacity and GNOME Shell themes."
url="http://gnome-look.org/content/show.php/Elegant+Brit+3.6?content=156683"
license=('GPL3')
arch=('any')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/351688473/elegant_brit_3_6_by_baggypants12000-d5tdwk9.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('2e32a111113dccc45c33b7b1efa1b128')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/Elegant_Brit-3.6" "${pkgdir}/usr/share/themes/"
}
