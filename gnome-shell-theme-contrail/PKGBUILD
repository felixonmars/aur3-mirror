### Author: ~theRealPadster <http://therealpadster.deviantart.com/>
# Maintainer: Charles Briere <charlesbriere dot flatzo at gmail dot com>

pkgname=gnome-shell-theme-contrail
pkgver=1.0
pkgrel=1
pkgdesc="Contrail GNOME Shell Theme"
url="http://therealpadster.deviantart.com/art/Contrail-313169671?q=gallery%3Atherealpadster%2F26241833&qo=7"
license=('cc-by-nc-sa-3.0')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=(http://www.deviantart.com/download/313169671/contrail_by_therealpadster-d56gb9j.zip)
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('014af7b54cff58a621c53c9062958b92')



package() {
  mkdir -p ${pkgdir}/usr/share/themes/Contrail

  unzip -o contrail_by_therealpadster-d56gb9j.zip
  ls -lrta $srcdir
  cp -R $srcdir/Contrail/gnome-shell $pkgdir/usr/share/themes/Contrail/

  chmod -R 755 ${pkgdir}/usr/share/themes/Contrail
}



