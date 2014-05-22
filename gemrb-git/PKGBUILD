# Maintainer: Jun Go <gojun at gmail dot com>
# Contributor: Apkawa <apkawa at gmail dot com>

pkgname=gemrb-git
pkgver=v0.8.0.r680.gcbfa777
pkgrel=1
pkgdesc="A portable open-source implementation of Bioware's Infinity Engine."
arch=('i686' 'x86_64')
url="https://github.com/gemrb/gemrb"
license=('GPL')
depends=('hicolor-icon-theme' 'python' 'python2' 'sdl_ttf' 'openal' 'libpng' 'sdl_mixer')
makedepends=('git')
conflicts=('gemrb')
provides=('gemrb')

source=("$pkgname"::'git://github.com/gemrb/gemrb.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DINSOURCEBUILD=1 .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
