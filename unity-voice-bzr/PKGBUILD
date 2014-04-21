# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=unity-voice-bzr
_bzrname=unity-voice
pkgver=30
pkgrel=2
pkgdesc="A simple "command and control" type voice recognition service, using pocketsphinx under the hood."
arch=('i686' 'x86_64')
url="https://launchpad.net/unity-voice"
makedepends=('bzr')
depends=('qt5-base' 'pocketsphinx' 'libqtdbustest-bzr' 'valgrind')
provides=('unity-voice')
license=('GPL')
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~unity-team/$_bzrname/trunk/"
        'gmock.patch'
        'python.patch')
md5sums=('SKIP'
         '6e7fae6fbb5315481854b0b3c4a5111f'
         'dd6348238e87f15262f18f4b53f46fa9')

pkgver() {
  cd $_bzrname
  bzr revno
}

prepare() {
  cd "$srcdir"/$_bzrname

  # This prevents the build from attempting to rebuild gmock
  patch -p1 -i "${srcdir}/gmock.patch"

  # This prevents an error with python making the build fail
  patch -p1 -i "${srcdir}/python.patch"
}

build() {
  cd "$srcdir"/$_bzrname
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd "$srcdir"/$_bzrname
  make DESTDIR="$pkgdir" install
}
