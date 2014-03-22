# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=mist-icon-theme-xfce
pkgver=0.1
pkgrel=1
pkgdesc="Extra icons for the Mist Icon Theme for Xfce compatibility"
arch=('any')
url="https://wiki.gnome.org/GnomeArt"
license=('GPL')
depends=('mist-icon-theme')
source=('mist-icon-theme-xfce-source.tar.gz')
install='mist-icon-theme-xfce.install'
sha256sums=('8e7df33626b70182f44590182704ed26658ddb2c156190e763516fcb7e049844')

package() {
  cp -R $srcdir/usr $pkgdir
}
