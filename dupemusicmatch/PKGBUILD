# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Leigh <leighallison@earthlink.net.com>
# Contributor: FJ <joostef@gmail.com>

pkgname=dupemusicmatch
pkgver=2.3
pkgrel=3
pkgdesc="A tool to quickly find duplicate MP3/Ogg/FLAC files via letter matching"
arch=('any')
url="http://dupemusicmatch.sourceforge.net/"
license=('GPL')
depends=('mutagen' 'python2-numpy')
optdepends=('pygtk>=2.8.0: for GUI support'
            'audacious:    for GUI support')
source=(http://downloads.sourceforge.net/$pkgname/DupeMusicMatch-$pkgver.tar.gz
        dmm.desktop dmm.launcher dmm.png)
md5sums=('8cb9e970b4a01e908f0b0c1160a7a716'
         '69ad643fd43e3a1fcb98480ad516c2af'
         'f4f19b2b040e9c15f89836631462fe9a'
         '2e31e2f04878a7dae0348efd2527a76e')

build() {
  cd "$srcdir/DupeMusicMatch-$pkgver"

  # port to python2-numpy
  python2 -c 'import numpy.oldnumeric.alter_code1 as noa; noa.converttree(".")'
  sed -i '1s/python/&2/' *.py
  sed -i '/^import/s/Numeric, //;/^import/a\import numpy.oldnumeric as Numeric' core.py
}

package() {
  cd "$srcdir/DupeMusicMatch-$pkgver"

  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -cm644 *.py *.glade "$pkgdir/usr/share/$pkgname"
  install -Dm644 locale/de/LC_MESSAGES/$pkgname.mo \
    "$pkgdir/usr/share/locale/de/LC_MESSAGES/$pkgname.mo"

  install -Dm755 ../dmm.launcher "$pkgdir/usr/bin/dmm"
  install -Dm644 ../dmm.desktop "$pkgdir/usr/share/applications/dmm.desktop"
  install -Dm644 ../dmm.png "$pkgdir/usr/share/pixmaps/dmm.png"
}

# vim:set ts=2 sw=2 et:
