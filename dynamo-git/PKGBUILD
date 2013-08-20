# Maintainer: Maciej Chudak <chudak dot maciej at gmail dot com>
pkgname=dynamo-git
pkgver=1.1.1511.gc61a6ff
pkgrel=1
pkgdesc="A general event-driven particle simulator."
arch=('i686' 'x86_64')
url="http://dynamomd.org/"
license=('GPL3')
depends=('boost-libs' 'python2')
makedepends=('boost-build-nightly' 'gcc' 'git' 'make' 'pkg-config')
optdepends=(
  'cwiid: Wii-mote support'
  'ffmpeg: recording visualisations directly to a movie file'
  'glew>=1.6.0: visualiser support'
  'gtkmm: visualiser support'
  'libcl: OpenCL support'
  'opencl-headers: OpenCL support'
  )
source=('git+https://github.com/toastedcrumpets/DynamO.git')
md5sums=('SKIP')

_gitname="DynamO"

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|^dynamo-||;s|-|.|g'
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
