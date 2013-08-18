# Maintainer: Robert Orzanna <orschiro@gmail.com>
pkgname=gnome-shell-extension-imgur-git
pkgver=20130804
pkgrel=1
pkgdesc="A simple GNOME Shell extension to upload screenshots directly to imgur.com"
arch=('any')
url="https://github.com/OttoAllmendinger/gnome-shell-imgur"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/OttoAllmendinger/gnome-shell-imgur.git')
md5sums=('SKIP')

package() {
  cd gnome-shell-imgur/src
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/gnome-shell-imgur@ttll.de"
  cp -R * "$pkgdir/usr/share/gnome-shell/extensions/gnome-shell-imgur@ttll.de/"
}
