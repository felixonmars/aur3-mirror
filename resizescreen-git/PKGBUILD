# Maintainer: Stephen Bell <theredbaron1834@yahoo.com>

pkgname=resizescreen-git
pkgver=1
pkgrel=2
pkgdesc="A simple wrapper around xrandr --panning/scale to boost virtual screen size. Ideal for netbooks like the Eeepc or Aspire One which  have small screens."
arch=('any')
url="https://github.com/theredbaron1834/Scripts"
license=('GPL')
depends=('xorg-xrandr' 'sed' 'grep' 'coreutils' 'gawk')
source=('git://github.com/theredbaron1834/Scripts.git')
md5sums=('SKIP')
conflicts=('resizescreen')

package() {
  cd "$srcdir/Scripts"
  install -Dm755 "$srcdir/Scripts/resizescreen" "$pkgdir/usr/bin/resizescreen"
}
