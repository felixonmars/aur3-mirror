# Maintainer: slowpoke (Proxy) <proxypoke at lavabit dot com>

pkgname=urxvi
pkgver=1
pkgrel=1
pkgdesc="keyboard navigation for rxvt-unicode (urxvt)"
arch=('any')
url="http://www.chipstips.com/?p=588"
license=('custom:Open Works License')
depends=('rxvt-unicode')
backup=('usr/lib/urxvt/perl/urxvirc')
source=('http://www.chipstips.com/download/urxvi.tar.bz2')
md5sums=('969700a0f79fd79bd5226a3d9ba8a778')

package() {
  install -DT $srcdir/urxvi/urxvi $pkgdir/usr/lib/urxvt/perl/urxvi
  install -DT $srcdir/urxvi/urxvirc $pkgdir/usr/lib/urxvt/perl/urxvirc

  install -DT $srcdir/urxvi/license.txt \
              $pkgdir/usr/share/licenses/urxvi/license.txt

  install -DT $srcdir/urxvi/README $pkgdir/usr/share/doc/urxvi/README
  install -DT $srcdir/urxvi/SLIPS-REFERENCE \
              $pkgdir/usr/share/doc/urxvi/SLIPS-REFERENCE
}

# vim:set ts=2 sw=2 et:
