# Maintainer: Weegee <weegee at devzero dot info>

pkgname=obs-git
pkgver=r1014.7c8ef6f
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording"
arch=('i686' 'x86_64')
url="http://obsproject.com/"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libgl' 'libxinerama' 'libxkbcommon-x11' 'qt5-base' 'qt5-x11extras')
makedepends=('git' 'cmake')
optdepends=('libfdk-aac: Fraunhofer FDK AAC codec support')
options=()
source=('obs-studio::git+https://github.com/jp9000/obs-studio.git')
md5sums=('SKIP')

_gitname=obs-studio

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  cmake ./ -DCMAKE_INSTALL_PREFIX='/usr'
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

