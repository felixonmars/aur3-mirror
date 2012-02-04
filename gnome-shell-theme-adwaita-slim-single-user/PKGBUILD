# Author: ambrevar <ambrevar at gmail dot com>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-adwaita-slim-single-user
pkgver=20110924
pkgrel=2
pkgdesc="Default GNOME Shell theme clone with reduced icon size in Applications view. No system wide installation."
url="http://gnome-look.org/content/show.php?content=144481"
license=('GPL')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://gnome-look.org/CONTENT/content-files/144481-adwaita-slim.tar.gz")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
sha256sums=('1bf4478eba7fbe7c462ae8ca9dd8b75e4fbce13c72611283357578f0eec08c29')


package() {
  mkdir -p ${pkgdir}/$HOME/.themes/
  cp -R ${srcdir}/Adwaita-Slim ${pkgdir}/$HOME/.themes/
  chmod -R 755 ${pkgdir}/$HOME/.themes/Adwaita-Slim
}

