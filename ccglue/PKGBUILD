# Maintainer  : Fernando "Firef0x" G.P. da Silva <firefgx { aT ) gmail [ d0t } com>
# Contributor : Fernando "Firef0x" G.P. da Silva <firefgx { aT ) gmail [ d0t } com>
# Contributor : Daniel Strandberg <esodax!nospam!@gmail.com>

pkgname=ccglue
pkgver=0.6.0
pkgrel=3
pkgdesc="Generate cross-reference cctree database files from cscope and/or ctags database files."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ccglue/"
license=('GPL3')
optdepends=('cscope: Generate cscope database files for ccglue')
source=("http://downloads.sourceforge.net/project/ccglue/src/ccglue-release-${pkgver}.tar.bz2"
        "ccglue-remove-acconfig.patch")
md5sums=('c2d2565380b1fb481a9e80325059c027'
         'f9c08937b75cb36ceaf888c7436698a3')

prepare() {
  cd "ccglue-${pkgver}"

  patch -Np1 -i ../ccglue-remove-acconfig.patch

  sed -i 's/0.4.0/0.6.0/g' doc/*
  sed -i 's/0.4.0/0.6.0/g' src/*
}

build() {
  cd "ccglue-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "ccglue-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:sts=2:sw=2:ts=2:et:
