# Author: Julien MISCHKOWITZ <wain@archlinux.fr>
# Author: tuxce <tuxce.net@gmail.com>

pkgname=yaourt-ssl3
pkgver=1.3
pkgrel=1
pkgdesc="A pacman wrapper with extended features and AUR support - with patch to use SSL-version-3"
arch=('any')
url="http://www.archlinux.fr/yaourt-en/"
license=(GPL)
provides=('yaourt')
conflicts=('yaourt')
depends=('diffutils' 'pacman>=4.1' 'package-query-ssl3' 'gettext')
optdepends=('aurvote: vote for favorite packages from AUR'
      'customizepkg: automatically modify PKGBUILD during install/upgrade'
      'rsync: retrieve PKGBUILD from official repositories')
backup=('etc/yaourtrc')
source=("http://mir.archlinux.fr/~tuxce/releases/yaourt/yaourt-$pkgver.tar.gz"
	"ssl3.patch")

build() { 
  cd "$srcdir/yaourt-$pkgver/"
  patch -p1 -i $srcdir/ssl3.patch	# By mhsekhavat <sekhavat17@gmail.com>
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var 
}

package() {
  cd "$srcdir/yaourt-$pkgver/"
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('972173967acd160c987c6dce15a431f8'
         '0a13f39fc052b6c6244cbb72bcfafabd')
