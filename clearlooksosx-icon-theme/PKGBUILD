# Maintainer: carukia <hornetsnest0@gmail.com
# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname=clearlooksosx-icon-theme
pkgver=3.7.6
pkgrel=2
pkgdesc='OSX icon theme for GNOME.'
url='http://gnome-look.org/content/show.php/?content=69487'
source=("http://205.196.120.216/jd3irz5d1qfg/bz36lzssz1s822l/ClearlooksOSX_$pkgver.tar.gz")
md5sums=('d76575b0eed723c4227c91327d72de20')
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')

package() {
	mkdir -p "$pkgdir/usr/share/icons/"
	cp -r "$srcdir/ClearlooksOSX/" "$pkgdir/usr/share/icons/"
}

