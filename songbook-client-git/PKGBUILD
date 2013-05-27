# Maintainer: Sirius Bakke <sirius@bakke.co>
pkgname=songbook-client-git
_gitname=songbook-client
pkgver=0.7.9.141.g33c740c
pkgrel=1
pkgdesc="Qt4 client for building LaTeX songbooks (lyrics, guitar tabs, lilypond sheets) based on patacrep songs"
arch=('i686', 'x86_64')
url="http://www.patacrep.com"
license=('GPL')
groups=()
depends=('qt4' 'libarchive' 'hunspell')
makedepends=('cmake' 'git')
optdepends=('python2' 'lilypond' 'texlive-core' 'texlive-langextra' 'texlive-latexextra' 'texlive-fontsextra')
provides=('songbook-client')
conflicts=()
replaces=()
backup=()
options=()
install=songbook-client-git.install
changelog=
source=('git://github.com/crep4ever/songbook-client.git')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  # git describe --always | sed 's|-|.|g'
  # songbook-client uses this command to set VERSION
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd $_gitname
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd $_gitname
  cd build
  make DESTDIR="$pkgdir/" install
}
