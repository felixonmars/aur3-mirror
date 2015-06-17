# Maintainer: trile7 at gmail dot com

pkgname=trash
pkgver=0.4.0
pkgrel=3
pkgdesc="Script to trash file, restore file, or empty trash.  Support multiple partition/drive"
url="http://bashscripts.googlecode.com"
arch=('any')
license=('GPL3')
depends=(coreutils bash)
source=($url/files/$pkgname-$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname" "$pkgdir/usr/bin"
  cp * "$pkgdir/usr/share/$pkgname"
  ln -s /usr/share/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}

md5sums=('4080af432643da90753da7f8d7ce423d')
