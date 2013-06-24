# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=fdesktoprecorder-git
pkgver=466.90e8bb4
pkgrel=2
pkgdesc="A program that can video record a single window or your entire desktop using ffmpeg. (GIT version)"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=147844"
depends=('kdelibs' 'ffmpeg' 'xorg-xwininfo')
makedepends=('cmake' 'automoc4' 'git')
provides=('fdesktoprecorder')
conflicts=('fdesktoprecorder')
license=('GPL')
source=("fdesktoprecorder::git+https://github.com/froksen/FDesktopRecorder.git")
md5sums=('SKIP')
_gitname="fdesktoprecorder"

pkgver() {
  cd "${_gitname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  rm -fr build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "${_gitname}/build"
  make DESTDIR="${pkgdir}" install
}
