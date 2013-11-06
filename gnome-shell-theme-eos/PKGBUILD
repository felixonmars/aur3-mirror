# Maintainer: g1smo
# Submitter: M0Rf30
pkgname=gnome-shell-theme-eos
pkgver=1.8
pkgrel=1
pkgdesc="This is a GNOME Shell theme based on the Elementary GTK2 theme."
url="http://zagortenay333.deviantart.com/art/eOS-Gnome-Shell-402527960"
license=('GPLv3' 'LGPLv2')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=('http://gnome-look.org/CONTENT/content-files/160827-eOS-Gnome-Shell.zip')
 

package() {
 cd "$srcdir/eOS-Gnome-Shell"
  
 # Install the theme and remove backup files
 mkdir -p "$pkgdir/usr/share/themes/ElementaryOS/gnome-shell"
 cp -r gnome-shell/*  "$pkgdir/usr/share/themes/ElementaryOS/gnome-shell"
 find "$pkgdir" -name *~ -type f -exec rm -f '{}' \;
}

md5sums=('132df429eec1a1ed837e9cd29d956ef2')
