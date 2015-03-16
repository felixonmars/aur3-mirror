# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor:  Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Jon Austin (IRC: slypheed) <jon.i.austin (gmail)>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Bernardo 'smoge' Barros <bernardobarros@gmail.com>

_pkgname=csound
pkgname=csound-git
pkgver=6.03.2.r838.g60eb294
pkgrel=1
pkgdesc="programming language designed and optimized for sound rendering and signal processing"
url="http://www.csounds.com/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('fltk' 'fluidsynth' 'liblo' 'portaudio' 'portmidi' 'tk' 'curl' 'stk')
makedepends=('pd' 'cmake' 'gmm' 'swig' 'java-environment' 'dssi' 'boost' 'luajit' 'eigen')
optdepends=('csoundqt: qt frontend'
            'cecilia: tcl/tk frontend'
            'cecilia4: wxpython frontend'
            'vim: vim frontend'
            'vim-csound: syntax highlighting and bindings for vim'
            'java-environment: java wrapper'
            'luajit: lua wrapper'
            'python2: python wrapper')
provides=('csound' 'csound5')
conflicts=('csound' 'csound5' 'csound6-git')
source=(git://github.com/csound/csound.git
        csound.sh)
sha256sums=('SKIP'
            '5ad5c7f7b538242b9ca42587f66b0329b5082de01e123c84bc0a3f5a8fbb87df')


pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  # install modules to proper paths
  sed -i '/^set.*MODULE_INSTALL_DIR/d' CMakeLists.txt
  sed -i '/execute_process\ (/,+4 d' CMakeLists.txt
  sed -i '/pdname/{n;s/LIBRARY/PD_MODULE/2}' frontends/CMakeLists.txt
}

build() {
  cd $_pkgname
  mkdir -p bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DPYTHON_MODULE_INSTALL_DIR=/usr/lib/python2.7/site-packages \
           -DJAVA_MODULE_INSTALL_DIR=/usr/lib/csound/java \
           -DLUA_MODULE_INSTALL_DIR=/usr/lib/lua/5.1 \
           -DPD_MODULE_INSTALL_DIR=/usr/lib/pd/extra
  make
}

package() {
  cd $_pkgname/bld
  make DESTDIR="$pkgdir/" install

  # export vars in profile.d
  install -Dm755 "$srcdir/csound.sh" "$pkgdir/etc/profile.d/csound.sh"
}

# vim:set ts=2 sw=2 et:
