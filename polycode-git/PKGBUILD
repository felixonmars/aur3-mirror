# Maintainer: Glen Oakley <goakley123@gmail.com>
# Edited: Kiril Zvezdarov <kzvezdarov@gmail.com>

pkgname=polycode-git
pkgrel=1
pkgver=d042872
pkgdesc="Polycode is a cross-platform framework for creative code."
arch=('i686' 'x86_64')
url="http://polycode.org/"
license=('MIT')
groups=()
depends=('gcc-libs' 'glu' 'openal' 'sdl')
makedepends=('git' 'cmake' 'python' 'python2-ply' 'doxygen')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
source=("$pkgname"::'git://github.com/ivansafrin/Polycode.git')
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  msg "Building Dependencies"
  cd Dependencies
  if [[ ! -d "Build/Debug" ]]; then
    mkdir -p Build/Debug
  fi
  cd Build/Debug
  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug ../..
  make
  cd ..
  mkdir Release
  cd Release
  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ../..
  make
  msg "Building Polycode"
  cd ../../..
  mkdir -p Build/Debug
  cd Build/Debug
  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug -DPOLYCODE_BUILD_BINDINGS=ON -DPOLYCODE_BUILD_PLAYER=ON -DPYTHON_EXECUTABLE=/usr/bin/python2 ../..
  make
  make install
  cd ..
  mkdir Release
  cd Release
  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DPOLYCODE_BUILD_BINDINGS=ON -DPOLYCODE_BUILD_PLAYER=ON -DPYTHON_EXECUTABLE=/usr/bin/python2 ../..
  make
  make install
  cd ../../Standalone
  mkdir Build
  cd Build
  cmake -G "Unix Makefiles" ..
  make install
  msg "Building the IDE"
  cd "$srcdir/$pkgname/IDE/Build/Linux"
  make
  msg "Skipping the C++ examples"
  #msg "Building C++ examples"
  #cd "$srcdir/$pkgname/Release/Linux/Framework/Examples/Linux/"
  #make LDFLAGS="-lX11 -lm"
}

package() {
  mkdir -p "$pkgdir/opt/polycode-git/IDE"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/doc"
  msg "Installing Framework, Standalone, and IDE"
  cp -r "$srcdir/$pkgname/Release/Linux/Framework" "$pkgdir/opt/polycode-git/"
  cp -r "$srcdir/$pkgname/Release/Linux/Standalone" "$pkgdir/opt/polycode-git/"
  cp -r "$srcdir/$pkgname/IDE/Build/Linux/Build" "$pkgdir/opt/polycode-git/IDE/"
  cp -r "$srcdir/$pkgname/Documentation" "$pkgdir/opt/polycode-git/"
  cd "$pkgdir/opt/polycode-git/IDE/Build"
  ln -s "/opt/polycode-git/Framework/Tools/polybuild" "$pkgdir/usr/bin/polybuild"
  ln -s "/opt/polycode-git/Framework/Tools/polyimport" "$pkgdir/usr/bin/polyimport"
  echo -e '#!/bin/bash\ncd /opt/polycode-git/Standalone/Player && ./PolycodePlayer' > "$pkgdir/usr/bin/PolycodePlayer"
  echo -e '#!/bin/bash\nif [ "$(basename "$1")" == "$1" ]; then dir="$(pwd)"; else dir=""; fi && cd /opt/polycode-git/Standalone/Player && ./PolycodePlayer "$dir/$1"' >> "$pkgdir/usr/bin/PolycodePlayer"
  chmod +x "$pkgdir/usr/bin/PolycodePlayer"
  echo -e '#!/bin/bash\ncd /opt/polycode-git/IDE/Build && ./Polycode' >> "$pkgdir/usr/bin/Polycode"
  chmod +x "$pkgdir/usr/bin/Polycode"
  ln -s "/opt/polycode-git/Documentation" "$pkgdir/usr/share/doc/polycode"
  cd "$srcdir/$pkgname/IDE/Build/Linux"
  msg "Installing Polycode Standalone IDE"
  mkdir -p "$pkgdir/opt/polycode-git"
  cp -r Build/* "$pkgdir/opt/polycode-git"
  mkdir -p "$pkgdir/usr/share/licenses/polycode-git"
  cp "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/polycode-git/"
}
