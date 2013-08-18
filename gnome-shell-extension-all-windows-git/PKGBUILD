# Maintainer: Robert Orzanna <orschiro@gmail.com>
pkgname=gnome-shell-extension-all-windows-git
pkgver=20130808
pkgrel=1
pkgdesc="A simple GNOME Shell extension to list open windows of all workspaces"
arch=('any')
url="https://github.com/lyonel/all-windows"
license=('GPL2')
depends=('gnome-shell>=3.6.0')
makedepends=('git')
source=('git://github.com/lyonel/all-windows.git')
md5sums=('SKIP')

package() {
  cd all-windows
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/all-windows@ezix.org"
  cp extension.js metadata.json "$pkgdir/usr/share/gnome-shell/extensions/all-windows@ezix.org/"
}
