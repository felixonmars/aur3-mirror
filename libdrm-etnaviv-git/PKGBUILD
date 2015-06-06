# Build for Libdrm with support for etnaviv 
# Maintainer: Brandon Edens <brandonedens@gmail.com>

_basename=libdrm
pkgname=$_basename-etnaviv-git
pkgver=2.4.37
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services"
arch=(armv7h i686 x86_64)
license=('custom')
depends=('glibc' 'libpciaccess')
makedepends=('git' 'sed' 'cairo' 'valgrind')
conflicts=('libdrm')
replaces=('libdrm' 'libdrm-new' 'libdrm-nouveau')
provides=('libdrm')
options=('!libtool')
url="https://github.com/etnaviv/libdrm/"
source=(git+https://github.com/etnaviv/libdrm
        no-pthread-stubs.patch
        remove-pthread.patch
        COPYING)
sha256sums=('SKIP'
            '66fb39be073c634abc7c2af238535a63b2a03990888eb8cc5ea79fa3ef083930'
            '4657b490ce5676a6d973d14a744cf5e31449a02e3fae7cb508eb8e417af4f986'
            '9631d4f694952e3e6ae5a05534c2e93e994e47d3413677a3a00e45c8cef6db93')

build() {
  cd $_basename
  patch -Np1 -i ../no-pthread-stubs.patch
  patch -Np1 -i ../remove-pthread.patch

  #libtoolize --force
  autoreconf --force --install
  ./configure --prefix=/usr \
      --enable-udev \
	  --enable-etnaviv-experimental-api
  make
}

check() {
  cd $_basename
  make -k check
}

package() {
  cd $_basename
  make DESTDIR="$pkgdir" install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
