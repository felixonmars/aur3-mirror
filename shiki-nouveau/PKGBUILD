
# Author: drewofdoom
#

 pkgname=shiki-nouveau
 pkgver=2012.11.01
 pkgrel=2
 pkgdesc="Shiki-Colors Gtk2.0/Gtk3.0/Metacity/Mutter/Cinnamon/Gnome-Shell theme."
 url="http://karashata.deviantart.com/art/Shiki-Nouveau-318365469"
 license=('LGPL')
 arch=('any')
 depends=('gtk-engine-murrine' 'gtk-engine-unico')
 optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
             'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
conflicts=(gtk-theme-shiki-colors)
source=("http://www.deviantart.com/download/318365469/shiki_nouveau__2012_11_01__by_karashata-d59jod9.zip?token=75c4a3f4f3b6eda74382d2854b7a12b5ac24fe3d&ts=1379699574")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
sha256sums=('f570b3e37adb3b8b97867616cd64bf83811424e3a19560fc7b7b58e84f644910')

package() {
 mkdir -p ${pkgdir}/usr/share/themes/
 cp -R ${srcdir}/shiki** ${pkgdir}/usr/share/themes/
 chmod -R 755 ${pkgdir}/usr/share/themes/
}
