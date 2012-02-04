# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Lucas De Marchi <lucas.de.marchi@gmail.com>

pkgname=perf-util
pkgver=3.1.0
pkgrel=1
pkgdesc="Performance monitoring tools using the Linux performance events infrastructure"
arch=(i686 x86_64)
license=('GPL')
url="http://www.kernel.org/"
depends=('elfutils' 'zlib' 'perl' 'python2')
# NB! This is detected build-time only
optdepends=(
  'libnewt: enable interactive console UI'
)
# necessary for building man pages -- 'perf help' relies on these
makedepends=('asciidoc' 'xmlto' 'libdwarf' 'linux-headers')
source=(http://www.politreco.com/files/perf-$pkgver.tar.bz2)

build() {
  cd $srcdir/perf-$pkgver/tools/perf

  # XXX why is this hack necessary?
  cp /usr/src/linux-3.*-ARCH/include/linux/const.h ../../include/linux/

  make PYTHON=python2 PYTHON_CONFIG=python2-config prefix=/usr \
      perfexecdir=lib/perf-core all man
}

package() {
  cd $srcdir/perf-$pkgver/tools/perf

  make PYTHON=python2 PYTHON_CONFIG=python2-config prefix=/usr PERF_VERSION=$pkgver \
      perfexecdir=lib/perf-core DESTDIR=$pkgdir/ install install-man

  install -dm 755 $pkgdir/usr/share/doc/$pkgname
  cp *.txt Documentation/*.txt $pkgdir/usr/share/doc/$pkgname
}
md5sums=('a0d66c97092e1ef44f6c2152ac31a6af')
