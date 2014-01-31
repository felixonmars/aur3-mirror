# Maintainer: XZS <d.f.fischer at web dot de>

pkgname="gnome-shell-extension-statustitlebar-git"
pkgdesc="Gnome-Shell extension that shows the focused window titlebar in the status panel."
pkgver=58.3a5f956
pkgrel=1
arch=(any)
url="https://github.com/emerinohdz/StatusTitleBar"
license=(GPLv2)
depends=('gnome-shell>=3.8')
makedepends=('git')
source=('git+https://github.com/emerinohdz/StatusTitleBar')
md5sums=('SKIP')

pkgver() {
  cd StatusTitleBar
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package () {
  cd StatusTitleBar
  rm README.md .gitignore
  destdir="$pkgdir/usr/share/gnome-shell/extensions/StatusTitleBar@devpower.org"
  install -d "$destdir"
  mv * "$destdir"
}
