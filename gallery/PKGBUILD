# Maintainer: Bryan Ischo <bryan at ischo dot com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

# Todo: chown/chgrp http webapps dir

pkgname=gallery
pkgver=3.0.9
pkgrel=3
pkgdesc="Open source web based photo album organizer."
arch=('i686' 'x86_64')
url="http://galleryproject.org/"
license=('GPL')
depends=('php' 'mariadb')
source=(http://downloads.sourceforge.net/gallery/$pkgname-$pkgver.zip)
sha512sums=('fd6f15abe69b4e80c1e3c24379e123fb2352cd7b0416e5a3aaedb857c32ff2412fc3eabba90e3227a8c3b0d1d27eedcf9a6e10c81b8dac8037f7019730b5fe89')

install=$pkgname.install

package() {
  mkdir -p "$pkgdir/usr/share/webapps"
  cp -a "$srcdir/gallery3" "$pkgdir/usr/share/webapps/"
}
