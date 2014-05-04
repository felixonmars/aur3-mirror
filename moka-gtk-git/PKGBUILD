pkgname=moka-gtk-git
_pkgname=moka-gtk-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Moka is an accompanying GTK3 theme to the Moka icon set."
arch=('any')
url="https://github.com/moka-project/moka-gtk-theme"
license=('GPL3')
depends=(gtk-engine-murrine)
makedepends=('git')
optdepends=()
provides=('moka-gtk-git')
conflicts=('moka-gtk-git')
source=('git+https://github.com/moka-project/moka-gtk-theme.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/themes/Moka
  install -d -m 755 "$pkgdir"/usr/share/themes/Moka-Dark

  # install theme
  cd $srcdir/moka-gtk-theme/Moka
  cp -r . "$pkgdir"/usr/share/themes/Moka/
  cd $srcdir/moka-gtk-theme/Moka-Dark
  cp -r . "$pkgdir"/usr/share/themes/Moka-Dark/
}
