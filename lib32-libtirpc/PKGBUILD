# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgbasename=libtirpc
pkgname=lib32-${_pkgbasename}
pkgver=0.2.2
pkgrel=2
pkgdesc="Transport Independent RPC library (SunRPC replacement) (lib32)"
arch=('x86_64')
url="http://libtirpc.sourceforge.net/"
license=('BSD')
depends=("${_pkgbasename}>=${pkgver}" 'lib32-libgssglue')
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/libtirpc/${_pkgbasename}-${pkgver}.tar.bz2
       libtirpc-0.2.1-fortify.patch
       libtirpc-0.2.3rc1.patch
       libtirpc-fix-segfault-0.2.2.patch)
md5sums=('74c41c15c2909f7d11d9c7bfa7db6273'
         '2e5c067f1651469dfbbdc91d3c9c60e8'
         'ac2a1657b44f4a99c37d8265b05b9133'
         '5a3ab55934cad4e8b38fc90c54756472')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  # fix http://bugs.gentoo.org/293593
  # https://bugs.archlinux.org/task/20082
  patch -Np1 -i ../libtirpc-0.2.1-fortify.patch
  # add patches from fedora git to make nfs-utils compile again
  patch -Np1 -i ../libtirpc-0.2.3rc1.patch
  patch -Np1 -i ../libtirpc-fix-segfault-0.2.2.patch
  sh autogen.sh
  autoreconf -fisv
  ./configure --prefix=/usr --libdir=/usr/lib32 --enable-gss CC="gcc -m32" CXX="g++ -m32"
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/{etc,usr/{include,share}}
}
