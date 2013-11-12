# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor : Fyda <solinde [at] gmail [dot] com>

_pkgbase=xgngeo
pkgname=$_pkgbase-hg
pkgver=17.r202.da20ee80b771
pkgrel=1
pkgdesc="A frontend for gngeo in Python and GTK (development version)"
url="http://www.choplair.org/?en/XGngeo"
arch=('any')
license=('GPL')
depends=('pygtk' 'python2' 'gngeo07')
makedepends=('mercurial')
conflicts=("$_pkgbase" "$_pkgbase-cvs")
provides=("$_pkgbase")
source=("$_pkgbase"::"hg+http://hg.berlios.de/repos/xgngeo"
        "pt_BR_$_pkgbase.po")
md5sums=('SKIP'
         '2727f129860d0d6f120e24ccc95a3a9a')
sha256sums=('SKIP'
            'f21bffa0bfb735ebcc90e77168f875a91451417aa967c993350a3f4dee1890dd')

pkgver() {
  cd "$srcdir/$_pkgbase"

  # get version, revision count and commit identifier
  printf "%s.r%s.%s" "$(grep 'VERSION =' setup.py | sed 's/[^0-9]//g')" \
    "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/$_pkgbase"

  # use python2
  sed 's|env python|env python2|' -i setup.py
  sed 's|env python|env python2|' -i data/py/__init__.py
  sed 's|env python|env python2|' -i data/script/xgngeo

  # fix portuguese(BR) translation (by josephgbr)
  cp "$srcdir/pt_BR_xgngeo.po" data/locale/pt_BR/LC_MESSAGES/xgngeo.po

  # fix locale paths to comply with Arch Linux directory structure
  sed 's|"share", "xgngeo", "locale"|"share", "locale"|' -i setup.py
  sed 's|datarootpath, "locale"|sys.prefix, "share", "locale"|' -i data/py/__init__.py
}

package() {
  cd "$srcdir/$_pkgbase"

  ./setup.py install --prefix="$pkgdir/usr" --optimize=1

  # link license
  ln -sf /usr/share/licenses/common/GPL2/license.txt \
    $pkgdir/usr/share/$_pkgbase/LICENSE.txt
}
