# Maintainer:  tuxce <tuxce.net@gmail.com>
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>

pkgname=yaourt-git-exp
pkgver=20110322
pkgrel=1
pkgdesc="A pacman wrapper with extended features and AUR support"
arch=('any')
url="http://www.archlinux.fr/yaourt-en/"
license=('GPL')
depends=('diffutils' 'pacman>=3.5' 'package-query-git')
makedepends=('git')
optdepends=('aurvote: vote for your favorite AUR packages'
    'customizepkg: automatically modify PKGBUILDs during install/upgrade'
    'rsync: retrieve PKGBUILD from official repositories'
    'pacman-color: fully colorized output')
provides=('yaourt')
conflicts=('yaourt' 'yaourt-git')
backup=('etc/yaourtrc')
install=yaourt.install

_gitroot=http://projects.archlinux.fr/yaourt.git
_gitname=yaourt

build() {
  cd "$srcdir"

  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
  else
    git clone -b exp $_gitroot
  fi

  rm -rf $_gitname-build
  git clone -b exp $_gitname $_gitname-build
  cd "$srcdir/$_gitname-build/src"
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var aururl=http://aur.archlinux.org
}

package() {
  cd "$srcdir/$_gitname-build/src"
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR=$pkgdir install
}
