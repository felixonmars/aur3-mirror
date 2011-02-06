# Maintainer: adriano <adriano.src@gmail.com>

pkgname=sreadahead
pkgver=1.0
pkgrel=2
pkgdesc="A readahead implementation optimized for solid state discs"
arch=('i686' 'x86_64')
url="http://code.google.com/p/sreadahead/"
#depends=('kernel26-fastboot')
install=sreadahead.install
source=(http://sreadahead.googlecode.com/files/${pkgname}-${pkgver}.tar.gz
sreadahead_trace_options.patch)
license=('GPL2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch < ${srcdir}/sreadahead_trace_options.patch
  make || return 1
  
  mkdir -p ${pkgdir}/sbin
  mkdir -p $/var/lib/sreadahead/debugfs
  
  cp ${srcdir}/${pkgname}-${pkgver}/sreadahead ${pkgdir}/sbin
  #cp ${srcdir}/${pkgname}-${pkgver}/sreadahead-pack ${pkgdir}/sbin
}

md5sums=('f9dc659f1bf209621a4f965decb14692'
         '7e3be14dcdea298d27868ffc1d7d3442')
