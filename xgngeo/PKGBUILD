# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Janitux <janitux <at> gmail.com>

pkgname=xgngeo
pkgver=16
pkgrel=6
pkgdesc="A frontend for gngeo in Python and GTK"
license="GPL"
arch=('i686' 'x86_64')
url="http://xgngeo.choplair.org/"
depends=('pygtk' 'python2' 'gngeo07')
source=("http://downloads.sourceforge.net/$pkgname/XGngeo-${pkgver}_final.tar.bz2"
        "pt_BR_$pkgname.po")
md5sums=('741d8099b6560b1f82518dbff90bd08b'
         '2727f129860d0d6f120e24ccc95a3a9a')

prepare() {
  cd "$srcdir/XGngeo-$pkgver"

  # use python2
  sed 's|env python|env python2|' -i setup.py
  sed 's|env python|env python2|' -i data/py/__init__.py
  sed 's|env python|env python2|' -i data/script/xgngeo_startup.py

  # fix portuguese(BR) translation (by josephgbr)
  cp "$srcdir/pt_BR_xgngeo.po" data/locale/pt_BR/LC_MESSAGES/xgngeo.po

  # fix paths to comply with Arch Linux directory structure
  sed 's|"share", "xgngeo","doc"|"share", "doc", "xgngeo"|' -i setup.py
  sed 's|"share", "xgngeo", "locale"|"share", "locale"|' -i setup.py
  sed 's|datarootpath, "locale"|sys.prefix, "share", "locale"|' -i data/py/__init__.py
}

package() {
  cd "$srcdir/XGngeo-$pkgver"

  ./setup.py install --prefix="$pkgdir/usr" --optimize=1

  # link license
  ln -sf /usr/share/licenses/common/GPL2/license.txt \
    $pkgdir/usr/share/$pkgname/LICENSE.txt
}
