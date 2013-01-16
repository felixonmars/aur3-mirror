# Maintainer: TDY <tdy@archlinux.info>

pkgname=bjj
pkgver=6.0
pkgrel=1
pkgdesc="Bill's Jammin' Jukebox for MPD and Squeezebox"
arch=('any')
url="http://www.thejavashop.net/bjj/"
license=('GPL3')
depends=('java-environment')
optdepends=('mpd: Music Player Daemon back-end'
            'squeezecenter: Squeezebox back-end')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver-linux.tar.gz
        $pkgname.desktop
        $pkgname.xpm)
md5sums=('97b86eb94cd3a5fb29dd5aa6f35c9408'
         '30e5791e6c572756eae174dc51c89b2d'
         '2f171afd5b4d23f056af7c976070d1e7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/java/$pkgname/lib/"
  install -m644 lib/* "$pkgdir/usr/share/java/$pkgname/lib/"
  install -m644 $pkgname.jar "$pkgdir/usr/share/java/$pkgname/"

  sed -i "1s///; 2c\HERE=/usr/share/java/$pkgname" startBJJ.sh
  install -Dm755 startBJJ.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../$pkgname.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
}

# vim:set ts=2 sw=2 et:
