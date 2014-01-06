# Maintainer: Marcel Krüger <zauguin@gmail.com>

pkgname=nodejs-i18n-git
pkgver=0.11.10.8.ge1f4f6a
pkgrel=1
pkgdesc='Evented I/O for V8 javascript with locale support'
arch=('i686' 'x86_64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl')
makedepends=('python2' 'git')
provides=('nodejs')
conflicts=('nodejs')
options=('!emptydirs')
source=($pkgname::git://github.com/joyent/node.git
        icu46::svn+http://src.chromium.org/svn/trunk/deps/third_party/icu46#revision=214189)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/^v//;s/-/./g'
}

prepare() {
  cd $pkgname
  mkdir -p deps/v8/third_party
  mv ../icu46 deps/v8/third_party/icu46

  msg 'Fixing for python2 name'
  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e "s_'python'_'python2'_" -i {} \;
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
}

build() {
  cd $pkgname

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --with-icu-path=deps/v8/third_party/icu46/icu.gyp \
    --shared-openssl

  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/nodejs/LICENSE
}
