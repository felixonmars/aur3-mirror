# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Det <nimetonmaili at gmail dot com>
# Contributor: Coolaman <coolaman@free.fr>

pkgname=splashy-theme-xfarch
pkgver=1
pkgrel=1
pkgdesc="Splashy theme for ArchLinux"
license=('custom')
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
depends=('splashy')
source=(http://coolaman.free.fr/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('6953552f07512ccea41b78e31614a4c3')

package() {
  cd $pkgname-$pkgver
  install -Dm644 boot.png "$pkgdir/usr/share/splashy/themes/xfarch/boot.png"
  install -Dm644 shutdown.png "$pkgdir/usr/share/splashy/themes/xfarch/shutdown.png"
  install -Dm644 theme.xml "$pkgdir/usr/share/splashy/themes/xfarch/theme.xml"
  install -Dm644 FreeSans.ttf "$pkgdir/usr/share/splashy/themes/xfarch/FreeSans.ttf"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
