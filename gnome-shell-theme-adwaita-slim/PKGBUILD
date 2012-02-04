# Author: ambrevar <ambrevar at gmail dot com>
# Maintainer: ambrevar <ambrevar at gmail dot com>

pkgname=gnome-shell-theme-adwaita-slim
pkgver=20111002
pkgrel=3
pkgdesc="Default GNOME Shell theme clone with reduced icon size in Applications view."
url="http://gnome-look.org/content/show.php?content=144481"
license=('LGPL')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://gnome-look.org/CONTENT/content-files/144481-Adwaita-Slim.tgz")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
sha256sums=('b37c7caaf018cd8282f0c0b3476a1d854191cad1bc51d0d4531d3cc56cf21190')


package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -R ${srcdir}/Adwaita-Slim ${pkgdir}/usr/share/themes/
  chmod -R 755 ${pkgdir}/usr/share/themes/Adwaita-Slim
}

