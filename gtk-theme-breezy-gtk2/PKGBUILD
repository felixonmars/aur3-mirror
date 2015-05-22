pkgname=gtk-theme-breezy-gtk2
pkgver=git052015
pkgrel=1
pkgdesc="A GTK+ 2 Theme Built to Match KDE's Breeze."
arch=('any')
url="https://github.com/scionicspectre/BreezyGTK"
license=('GPLv2')
depends=(gtk-engine-murrine)
makedepends=('git')
optdepends=()
provides=('breezy-gtk2')
conflicts=('gtk-theme-breezy')
source=('git+https://github.com/scionicspectre/BreezyGTK.git')
md5sums=('SKIP')

package() {

  install -d -m 755 "$pkgdir"/usr/share/themes/BreezyGTK

  cd $srcdir/BreezyGTK/BreezyGTK
  cp -r . "$pkgdir"/usr/share/themes/BreezyGTK/
}
