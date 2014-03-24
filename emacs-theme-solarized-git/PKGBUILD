# Maintainer: Jon Eyolfson <jon@eyl.io>

pkgname=emacs-theme-solarized-git
pkgver=r282.0d18923
pkgrel=1
pkgdesc="Emacs highlighting using Ethan Schoonover’s Solarized color scheme"
arch=('any')
url="https://github.com/sellout/emacs-color-theme-solarized/"
license=('MIT')
depends=('emacs')
makedepends=('git')
conflicts=('emacs-theme-solarized')
provides=('emacs-theme-solarized')
install="$pkgname.install"
source=("$pkgname"::'git://github.com/sellout/emacs-color-theme-solarized.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir/usr/share/emacs/etc/themes"
  cp -a "$srcdir/$pkgname/solarized"*.el "$pkgdir/usr/share/emacs/etc/themes"
}
