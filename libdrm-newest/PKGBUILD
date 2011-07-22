#Maintainer: Paolo Stivanin <www.polslinux.it>

pkgname=libdrm-newest
_pkgname=libdrm
pkgver=2.4.26
pkgrel=2
pkgdesc="Userspace interface to kernel DRM services"
arch=(i686 x86_64)
url="http://dri.freedesktop.org/"
depends=('glibc')
conflicts=('libdrm')
replaces=('libdrm' 'libdrm-newest')
provides=('libdrm=2.4.24')
options=('!libtool')
license=('gpl')
source=("http://dri.freedesktop.org/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=('4ae2666aca6b78b20d36a4e64ce5556b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  libtoolize --force || return 1
  aclocal || return 1
  autoconf || return 1
  automake || return 1
  ./configure --prefix=/usr \
      --enable-intel --enable-radeon \
      --enable-vmwgfx-experimental-api --enable-nouveau-experimental-api \
      --enable-udev || return 1
  make || return 1
}

package(){
  make DESTDIR="${pkgdir}" install || return 1
}

