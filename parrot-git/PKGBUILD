# Maintainer: Federico Cinelli <cinelli@aur.archlinux.org>

pkgname=parrot-git
pkgver=19983bc
pkgrel=1
pkgdesc="Virtual machine designed to efficiently compile and execute bytecode
for dynamic languages"
arch=('i686' 'x86_64')
url="http://www.parrot.org/"
license=('PerlArtistic')
depends=('perl' 'libffi' 'openssl')
makedepends=('git' 'perl-json')
optdepends=('freeglut: OpenGL support')
provides=('parrot')
conflicts=('parrot')
source=('git://github.com/parrot/parrot.git')
md5sums=('SKIP')

pkgver() {
  cd parrot
  git describe --always | sed 's|-|.|g'
}

build() {
  cd parrot
  perl Configure.pl --prefix=/usr \
    --parrot_is_shared \
    --disable-rpath \
    --mandir=/usr/share/man \
    --optimize
  
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$(pwd)/blib/lib"
  make all parrot_utils docs html
}

package() {
  cd parrot
  make DESTDIR="$pkgdir" install-dev
  sed -i "s#$srcdir#/usr/src#" "$pkgdir"/usr/lib/parrot/*/tools/lib/Parrot/Config/Generated.pm
} 
