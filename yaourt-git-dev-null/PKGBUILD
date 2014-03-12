# Maintainer: Gabriel B. Casella <gbc921@gmail.com>
# Contributor: tuxce <tuxce;net@gmail.com>
# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>

pkgname=yaourt-git-dev-null
pkgver=1.3.12.ga2a6315
pkgrel=1
pkgdesc="A pacman wrapper with extended features and AUR support patched to output makepkg to /dev/null"
arch=('any')
url="http://www.archlinux.fr/yaourt-en/"
license=('GPL')
depends=('package-query-git' 'pacman>=4.1')
makedepends=('git')
optdepends=('aurvote: vote for your favorite AUR packages'
            'customizepkg: automatically modify PKGBUILD during install/upgrade'
            'rsync: retrieve PKGBUILD from official repositories')
provides=('yaourt')
conflicts=('yaourt')
backup=('etc/yaourtrc')
source=('git+https://github.com/archlinuxfr/yaourt'
        pkgbuild.sh.in.patch)
md5sums=('SKIP'
        '206182b156087ed8d2f18c5cae6b4ad4')
_gitname=yaourt

pkgver () {
  cd $_gitname/src
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname/src
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var

  cd lib
  patch -uN pkgbuild.sh.in "$srcdir"/pkgbuild.sh.in.patch || return 1
}

package() {
  cd $_gitname/src
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
