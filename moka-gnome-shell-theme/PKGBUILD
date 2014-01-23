pkgname=moka-gnome-shell-theme
_pkgname=moka-gnome-shell-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Moka is the titular GNOME Shell theme of the Moka Project."
arch=('any')
url="https://github.com/snwh/moka-gnome-shell-theme"
license=('GPL3')
depends=()
makedepends=('git')
optdepends=()
provides=('moka-gnome-shell-theme')
conflicts=('moka-gnome-shell-theme')
source=('git://github.com/snwh/moka-gnome-shell-theme.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/themes/Moka

  # install theme
  cd $srcdir/moka-gnome-shell-theme/Moka
  cp -r . "$pkgdir"/usr/share/themes/Moka/
}
