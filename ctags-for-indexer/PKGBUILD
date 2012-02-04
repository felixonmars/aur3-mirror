# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=ctags-for-indexer
pkgver=5.8.1
pkgrel=1
pkgdesc="Generates an index file of language objects found in source files, with patch for vim-indexer"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
conflicts=('ctags')
provides=('ctags=5.8')
url="http://dfrank.ru/ctags581"
source=(http://downloads.sourceforge.net/sourceforge/ctags/ctags-5.8.tar.gz
	patch_ctags_581.patch)
md5sums=('c00f82ecdcc357434731913e5b48630d'
         '4fc93c12e51d48ba805de8d0c98b6bfb')

build() {
  cd ${srcdir}/ctags-5.8
  patch -p2 < ../patch_ctags_581.patch

  ./configure --prefix=/usr \
              --disable-external-sort
  make || return 1
  make prefix=${pkgdir}/usr install
}
