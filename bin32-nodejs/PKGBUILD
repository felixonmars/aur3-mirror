# $Id$
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>
# Contributor: monty <linksoft [at] gmx [dot] de>

pkgname=bin32-nodejs
pkgver=0.10.26
pkgrel=1
pkgdesc='Evented I/O for V8 javascript (32-bit)'
arch=('x86_64')
url='http://nodejs.org/'
license=('MIT')
depends=('lib32-openssl')
makedepends=('gcc-multilib' 'python2' 'lib32-gcc-libs')
checkdepends=('curl')
options=('!emptydirs')
source=(http://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz)
sha256sums=('ef5e4ea6f2689ed7f781355012b942a2347e0299da0804a58de8e6281c4b1daa')

prepare() {
  cd node-v$pkgver

  msg 'Fixing for python2 name'
  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e "s_'python'_'python2'_" -i {} \;
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
}

build() {
  cd node-v$pkgver

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --shared-openssl \
    --dest-cpu=ia32

  make
}

check() {
  cd node-v$pkgver
  make test || true
}

package() {
  cd node-v$pkgver

  make DESTDIR="$pkgdir" install

  # install docs as per user request
  install -d "$pkgdir"/usr/share/doc/nodejs-32
  cp -r doc/api/{*.html,assets} \
    "$pkgdir"/usr/share/doc/nodejs-32

  install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/nodejs-32/LICENSE

  # correct usr/lib to usr/lib32
  cd "${pkgdir}"/usr
  mv lib lib32

  # corrent include
  cd "${pkgdir}"/usr/include
  mv node node-32
  
  # correct soft-link to npm
  cd "${pkgdir}"/usr/bin
  rm npm
  ln -s ../lib32/node_modules/npm/bin/npm-cli.js npm
  
  # add -32 to binaries
  mv node node-32
  mv npm npm-32
  
  # add -32 to other files
  cd "${pkgdir}"/usr
  mv share/man/man1/node.1 share/man/man1/node-32.1
}

# vim:set ts=2 sw=2 et:
