# Maintainer: kubriel <kubriel at gmail dot com>

pkgname=pd-gem-git
_gitname=Gem
pkgver=374f713
pkgrel=1
pkgdesc="Graphics Environment for Multimedia - an external for PureData"
arch=('i686' 'x86_64')
url="http://puredata.info/community/projects/software/gem"
license=('GPL2')
depends=('libgl' 'libtiff' 'libjpeg' 'ftgl' 'mesa' 'avifile')
makedepends=('git' 'automake' 'make')
optdepends=('libunicap' 'ffmpeg' 'libquicktime' 'libdv4-dev' 'gmerlin')
conflicts=('pd-gem' 'pd-extended' 'pd-extended-svn')
source=("git://pd-gem.git.sourceforge.net/gitroot/pd-gem/Gem")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {

  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --enable-sse2 --with-pd=/usr/include/pd --without-assimp --disable-registerstruct
  make

}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
} 
