# Maintainer: Sigitas Mazaliauskas <sigisnn@gmail.com>

pkgname=catcodec
pkgver=1.0.3
pkgrel=1
pkgdesc="A tool for Transport Tycoon .cat files"
arch=('i686' 'x86_64')
url="http://www.openttd.org/en/download-catcodec"
license=('GPL2')
optdepends=('grfcodec')
source=("http://binaries.openttd.org/extra/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.bz2")
sha256sums=('b6a9fe31cf736b1432d84fd86ba7441159e3707c0387bb732eeb717f7d8aa9bb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i 's_/usr/local_/usr_' Makefile.bundle

  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

} 
