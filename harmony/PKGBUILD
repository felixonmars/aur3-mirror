# Maintainer: H.Gökhan Sarı <th0th@returnfalse.net>
pkgname=harmony
pkgver=0.1
pkgrel=1
pkgdesc="Harmony is an application that built for helping users to organize their music archives."
arch=(any)
url="http://code.returnfalse.net/app/harmony/"
license=('GPL')
depends=('python2' 'python2-gobject' 'mutagen')
source=(http://code.returnfalse.net/source/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('eb7328f7861c8cce42358d30e34f3b38')

#build() {
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D harmony.py "$pkgdir/usr/share/harmony/harmony.py"
  install -Dm755 harmony-gui.py "$pkgdir/usr/share/harmony/harmony-gui.py"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/share/harmony/harmony-gui.py "$pkgdir/usr/bin/harmony"

  cp -R ui "$pkgdir/usr/share/harmony/ui"

  cd "$srcdir/$pkgname-$pkgver/extra"
    install -D harmony.desktop "$pkgdir/usr/share/applications/harmony.desktop"
    install -D harmony.png "$pkgdir/usr/share/pixmaps/harmony.png"
}

# vim:set ts=2 sw=2 et:
