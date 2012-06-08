# $Id: PKGBUILD 160939 2012-06-07 07:26:49Z allan $
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

_pkgbasename=fakeroot
pkgname=lib32-${_pkgbasename}
pkgver=1.18.4
pkgrel=1
pkgdesc="Gives a fake root environment, useful for building packages as a non-privileged user (32-bit)"
arch=('x86_64')
license=('GPL')
url="http://packages.debian.org/fakeroot"
install=fakeroot.install
depends=('lib32-glibc' 'filesystem' 'sed' 'util-linux' 'sh')
options=('!libtool')
source=(http://ftp.debian.org/debian/pool/main/f/${_pkgbasename}/${_pkgbasename}_${pkgver}.orig.tar.bz2)
md5sums=('706171d8d520b1ca1576ac73f2ceb4f3')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32/libfakeroot \
              --disable-static --with-ipc=sysv
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR=${pkgdir} install

  # this is lib32 package, we do not want binaries and manpages
  rm -rf ${pkgdir}/usr/{bin,share}
}
