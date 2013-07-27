### Author: ~theRealPadster <http://therealpadster.deviantart.com/>
# Maintainer: Charles Briere <charlesbriere dot flatzo at gmail dot com>

pkgname=gnome-shell-theme-acid
pkgver=1.3
pkgrel=1
pkgdesc="ACID GNOME Shell Theme"
url="http://therealpadster.deviantart.com/art/ACID-317583161"
license=('cc-by-nc-sa-3.0')
arch=('any')
depends=('gnome-shell' 'cantarell-fonts')
makedepends=('wget' 'unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.'
            'acid-gtk-theme: GTK Theme that integrate well with this Gnome Shell Theme'
	    'python-gobject: Colour chooser for ACID theme')
source=(http://fc08.deviantart.net/fs71/f/2013/194/9/4/acid_by_therealpadster-d592wqh.zip)
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('600a6009ac392229e670488bf2040baf')



package() {
  mkdir -p ${pkgdir}/usr/share/themes/ACID

  unzip -o acid_by_therealpadster-d592wqh.zip
  ls -lrta $srcdir
  cp -R $srcdir/ACID $pkgdir/usr/share/themes/

  # Modifications as theme installed in /usr/share/theme
  echo '#!/usr/bin/env python3' > \
	  ${pkgdir}/usr/share/themes/ACID/configurator/configurator.py
  sed '21s@.*@        self.installDir="/usr/share/themes/ACID"@'\
	  ${srcdir}/ACID/configurator/configurator.py >> \
	  ${pkgdir}/usr/share/themes/ACID/configurator/configurator.py
  sed 's@\$HOME/\.@/usr/share/@' \
	  ${srcdir}/ACID/configurator/colour-changer.sh > \
	  ${pkgdir}/usr/share/themes/ACID/configurator/colour-changer.sh

  
  chmod -R 755 ${pkgdir}/usr/share/themes/ACID
}



