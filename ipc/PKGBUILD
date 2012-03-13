# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

# todo: create /etc/rc.d/ipc

pkgname=ipc
pkgver=3.9.1
pkgrel=2
pkgdesc="Flexible, efficient, network-based inter-process message passing library"
arch=('i686' 'x86_64')
url="http://www.cs.cmu.edu/~ipc/"
license=('custom:simplified BSD')
depends=('glibc' 'gcc-libs' 'flex' 'bison')
source=(http://www.cs.cmu.edu/afs/cs/project/TCA/ftp/$pkgname-$pkgver.tar.gz
	$pkgname.patch)
md5sums=('2a3323618db3e6ec35524f7185af3f4a'
         'd92d42baa6914a1bada7cce3bb88e1de')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  # Patch for errors
  patch -p1 -i "${srcdir}/$pkgname.patch"

  # Disable lisp, java and python bindings
  sed -i -e 's|etc src lisp java python test doc xdrgen|etc src test doc xdrgen|' "${srcdir}/$pkgname-$pkgver/GNUmakefile"

  # Step one: build the ipc library in the src directory.
  cd "${srcdir}/$pkgname-$pkgver/src"
  make	INSTALL_DIR="${srcdir}/$pkgname-$pkgver"	\
	CFLAGS=-Wno-deprecated				\
	MAKE_SHARED_LIBS=1				\
	LD_SHARED="gcc -shared"				\
	THREADED=1					\
	NMP_IPC=1					\
	BDIR="${pkgdir}/usr/bin"			\
	LDIR="${pkgdir}/usr/lib"			\
	install

  # Step two: build the rest.
  cd "${srcdir}/$pkgname-$pkgver"
  make	INSTALL_DIR="${srcdir}/$pkgname-$pkgver"	\
	CFLAGS=-Wno-deprecated				\
	MAKE_SHARED_LIBS=1				\
	LD_SHARED="gcc -shared"				\
	THREADED=1					\
	NMP_IPC=1					\
	BDIR="${pkgdir}/usr/bin"			\
	LDIR="${pkgdir}/usr/lib"			\
	install

  # Remove unwanted files
  find "${pkgdir}"/ -type f -name '.force' -exec rm '{}' \;
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  # install include
  install -Dm644 include/ipc.h "${pkgdir}/usr/include/ipc.h"

  # install license
  install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.TXT"

  # fix ownership
  chown -R root.root "${pkgdir}"/*
}
