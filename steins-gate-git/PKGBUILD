# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase=('libnpa' 'libnpengine' 'steins-gate')

# Hacks for AUR.
pkgname='steins-gate-git'
depends=('boost-libs' 'icu' 'sfml' 'gstreamer' 'gst-plugins-base-libs')
license=('MIT' 'LGPL3' 'GPL3')

true && pkgname=('libnpa-git' 'libnpengine-git' 'steins-gate-git')
pkgver=0.1.2.r0.ga00ec97
pkgrel=1
arch=('i686' 'x86_64')
url='http://dev.pulsir.eu/krofna/'
makedepends=('git' 'cmake' 'boost')
source=('git://github.com/FGRE/libnpa'
        'git://github.com/FGRE/libnpengine'
        'git://github.com/FGRE/steins-gate')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/steins-gate"
  git describe --long --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  for _name in ${pkgbase[@]}; do
    msg2 "Building $_name..."
    cd "$srcdir/$_name"
    #mkdir build && cd build
    cmake .
    make
  done
}

package_libnpa-git() {
  _pkgname='libnpa'
  pkgdesc='Free library for manipulating Nitroplus game files'
  license=('MIT')
  provides=("$_pkgname")
  conflicts=("$_pkgname")
  depends=('boost-libs' 'icu')

  cd "$srcdir/libnpa"

  install -d "$pkgdir/usr/lib/"
  install -Dm755 libnpa.so "$pkgdir/usr/lib/$_pkgname.so"

  install -d "$pkgdir/usr/include/$_pkgname"
  install -Dm644 include/* "$pkgdir/usr/include/$_pkgname"

  install -d "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname"
}

package_libnpengine-git() {
  _pkgname='libnpengine'
  pkgdesc='Libre reimplementation of the Nitroplus Visual Novel game engine'
  license=('LGPL3')
  provides=("$_pkgname")
  conflicts=("$_pkgname")
  depends=('libnpa' 'sfml' 'gstreamer' 'gst-plugins-base-libs')

  cd "$srcdir/libnpengine"

  install -d "$pkgdir/usr/lib/"
  install -Dm755 libnpengine.so "$pkgdir/usr/lib/"

  install -d "$pkgdir/usr/include/$_pkgname"
  install -Dm644 include/* "$pkgdir/usr/include/$_pkgname"
}

package_steins-gate-git() {
  _pkgname='steins-gate'
  pkgdesc='Libre reimplementation of the Steins;Gate visual novel'
  license=('GPL3')
  provides=("$_pkgname")
  conflicts=("$_pkgname")
  depends=('libnpengine')

  cd "$srcdir/steins-gate"

  install -d "$pkgdir/usr/bin/"
  install -Dm755 steins-gate "$pkgdir/usr/bin/$_pkgname"
}
