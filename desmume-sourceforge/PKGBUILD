#!/bin/bash
# Maintainer: Austin Hoppe <auhop@outlook.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Anton Shestakov <engored*ya.ru>

pkgname=desmume-sourceforge
pkgver=0.9.9
pkgrel=1
pkgdesc='Nintendo DS emulator. Builds from SourceForge tarball and patches for experimental JIT support. Launch with --cpu-mode=1 to ensure (as should be default) JIT is enabled or disable JIT at launch with --cpu-mode=0 (for the interpreter) if problems occur.'
url='http://desmume.org/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('agg' 'gtkglext' 'libglade' 'libpcap' 'mesa' 'openal' 'sdl' 'soundtouch')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
conflicts=('desmume' 'desmume-cvs' 'desmume-svn')
provides=('desmume')
source=(http://sourceforge.net/projects/desmume/files/desmume/0.9.9/desmume-0.9.9.tar.gz
        use_jit-true.patch)
sha512sums=('ba5a965102559f048cd57718b4c50e6b2bd39eca4a5990e4cdf068bfa752fccb52d71911ea48da769c5ec18bb740f6b09e6c856ccc78b1e1adf23fd701d1fe31'
            'a0b69eea1c7883a571446ad2a3aafd8a7a24e9626c33fc787f99e72fdd2e1d625d5de8737990964acf85f2ef2b826810e48b16ea32297d886ff95593d1bc0524')

pkgver() {
  tar -xzvf desmume-0.9.9.tar.gz
  cd desmume-0.9.9
  echo $(cat src/version.cpp | grep -o -P '.{0,9}DESMUME_SUBVERSION_STRING,{0,0}' | tail -1 | sed '1s/^.//' | sed '1s/^.//' | rev | cut -c 28- | rev)
}

prepare() {
  cd desmume-0.9.9/src
  patch -Np0 -i ../../use_jit-true.patch
}

build() {
  cd desmume-0.9.9
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-wifi \
    --enable-openal \
    --enable-osmesa \
    --enable-hud \
    --enable-glade
  make
}

package() {
  cd desmume-0.9.9
  make DESTDIR="$pkgdir" install
}
