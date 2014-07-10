# Contributor: PLum <plum.michalski@gmail.com>
pkgname=pcompress
pkgver=2.4
_pkgver=
pkgrel=2
arch=(i686 x86_64)
pkgdesc="Pcompress is a utility to do compression/decompression and deduplication in parallel by splitting input data into chunks."
url="http://moinakg.github.io/pcompress/"
license=('LGPL v3')
makedepends=('gcc' 'cloog' 'yasm')
depends=('expat' 'lzo2' 'xz' 'attr' 'acl' 'libarchive' 'zlib' 'openssl')
source=("https://pcompress.googlecode.com/files/${pkgname}-${pkgver}${_pkgver}.tar.bz2")
sha1sums=("261ff21146aba4a319435c5dc9fc3997e39ac066")

build()
{
  cd $startdir/src
  tar -xvf ${pkgname}-${pkgver}.tar.bz2
  cd ${pkgname}-${pkgver}
  ./config --enable-debug --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
}
