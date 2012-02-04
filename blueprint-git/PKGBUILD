# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=blueprint-git
pkgver=20111221
pkgrel=1
pkgdesc="Reverse engineer server configuration"
arch=('any')
url="http://devstructure.com/"
license=('BSD')
depends=('python2' 'git')
optdepends=()
makedepends=('git')
provides=('blueprint')
conflicts=('blueprint')
source=()
md5sums=()

_gitroot="git://github.com/devstructure/blueprint.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"
  git submodule update --init
  make
  make DESTDIR="$pkgdir/" prefix="/usr" sysconfdir="/etc" install
}

# vim:set ts=2 sw=2 et:
