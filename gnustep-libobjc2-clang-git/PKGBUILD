# Maintainer: X0rg

pkgname=gnustep-libobjc2-clang-git
_gitname=gnustep-libobjc2
pkgver=734.b18be6c
pkgrel=2
pkgdesc="The GNUstep Objective-C runtime is designed as a drop-in replacement for the GCC runtime, using Clang"
arch=('any')
url="http://www.gnustep.org/"
license=('custom')
groups=('gnustep-clang-git')
depends=('gcc-libs')
makedepends=('git' 'clang' 'gnustep-make-clang-git')
conflicts=('gnustep-libobjc2-git')
options=('!buildflags')
source=('git://github.com/gnustep/gnustep-libobjc2.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_gitname
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Créé le dossier 'build'..."
  else
    msg2 "Create 'build' directory..."
  fi
  mkdir -v ./build

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Supprime le fichier 'GNUmakefile'..."
  else
    msg2 "Delete 'GNUmakefile' file..."
  fi
  rm -v ./GNUmakefile
}

build() {
  cd $_gitname/build

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'cmake'..."
  else
    msg2 "Run 'cmake'..."
  fi
  OBJCFLAGS=-fblocks CC=clang CXX=clang++ cmake ..

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'make'..."
  else
    msg2 "Run 'make'..."
  fi
  make
}

# check() {
#   cd $_gitname/build
#   make test
# }

package() {
  cd $_gitname/build
  make DESTDIR="$pkgdir" install

  cd ..
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Installe la licence..."
  else
    msg2 "Install the license..."
  fi
  install -v -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}