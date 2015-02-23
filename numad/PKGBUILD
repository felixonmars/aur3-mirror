# Maintainer: G. Richard Bellamy <rbellamy@pteradigm.com>

pkgname=numad
pkgver=0.5
pkgrel=2

pkgdesc="A user-level Deamon that monitors NUMA topology and usage and distributes loads for good locality for the purpose of providing the best performance, by avoiding unnecessary latency."

arch=('i686' 'x86_64')
url="https://git.fedorahosted.org/cgit/numad.git/"
license=('LGPL2')

source=(https://git.fedorahosted.org/cgit/numad.git/snapshot/${pkgname}-${pkgver}.tar.gz
        Makefile.patch)

sha256sums=('0e229e73b593f12665bee8cc7b56ca8731956b092cd0b58b48079eb2796984b4'
            'fe00706f1e398aee39dd65b6fd4dd7a30d2412456b8ece65b3dc602e0561657e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -uN Makefile ../../Makefile.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make CFLAGS="${CFLAGS} -std=gnu99" LDFLAGS="${LDFLAGS} -lpthread -lrt -lm"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install prefix="${pkgdir}/usr"
  install -Dm644 numad.service "${pkgdir}/usr/lib/systemd/system/numad.service"
}

# vim:set ts=2 sw=2 et:
