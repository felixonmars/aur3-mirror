# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Dan Serban
# Contributors: DuGi, Thomas Dziedzic

_pkgname=fooaudio
pkgname=fooaudio-git
pkgver=r355.028da99
pkgrel=1
pkgdesc="Lightweight music player inspired by Foobar2000"
arch=(i686 x86_64)
url=https://gitorious.org/fooaudio
license=(GPL)
depends=(phonon-qt4)
makedepends=(git)
source=(git://git.gitorious.org/fooaudio/fooaudio.git)
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  qmake-qt4
  make
}

package() {
  cd $_pkgname/bin

  install -Dm755 $_pkgname "${pkgdir}"/usr/bin/$_pkgname
}
