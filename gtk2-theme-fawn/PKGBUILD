# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=gtk2-theme-fawn
pkgver=0.3
pkgrel=1
pkgdesc="A simple, warm GTK2 theme similar to Dyne"
arch=('any')
url="http://www.opendesktop.org/content/show.php?content=58426"
license=('GPL')
groups=('gtk2-themes')
depends=('gtk2')
source=(http://www.opendesktop.org/CONTENT/content-files/58426-Fawn.tar.gz)
md5sums=('558712e005a51d0763210f90b96709f0')

package() {
  cd "$srcdir"/Fawn

  tar -xf Fawn-gtk.tar.gz
  install -d "$pkgdir"/usr/share/themes/
  cp -r "$srcdir"/Fawn/Fawn "$pkgdir"/usr/share/themes/
}
