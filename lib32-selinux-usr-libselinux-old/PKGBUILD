# Maintainer: Eric Le Lay (neric27 <at> wanadoo <dot> fr)
# Contributor: 
# based on selinux-usr-libselinux-old

pkgname=lib32-selinux-usr-libselinux-old
_origname=libselinux
_release=20080909
pkgver=1.34.15
pkgrel=1
pkgdesc="SELinux userspace (libselinux NO PYTHON) compatible with CentOS 5.4 (32 bits)"
arch=(x86_64)
url="http://userspace.selinuxproject.org"
license=('GPL')
depends=('lib32-gcc-libs' 'selinux-usr-libselinux-old' 'lib32-selinux-usr-libsepol-old>=1.16.14')
conflicts=('selinux-usr-libselinux-python')
options=(!emptydirs)
source=(http://userspace.selinuxproject.org/releases/${_release}/stable/${_origname}-${pkgver}.tar.gz)
md5sums=('f60bc5d07e41ac47ef4577bdb099fab0')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  export PREFIX="/usr"
  export LIBDIR="/usr/lib32"
  
  make || return 1
  
  # don't build python wrapper
  #make pywrap || return 1

}

package() {
  cd "${srcdir}/${_origname}-${pkgver}"

  make DESTDIR=${pkgdir} PREFIX="$pkgdir/usr" SHLIBDIR="$pkgdir/usr/lib32" LIBDIR="$pkgdir/usr/lib32" install

  # don't build python wrapper
  #make DESTDIR="${pkgdir}" install-pywrap
  
  # just keep the lib32
  rm -r "$pkgdir"/usr/{sbin,include,share}
}
