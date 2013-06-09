# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-usr-libsepol
_origname=libsepol
_release=20130423
pkgver=2.1.9
pkgrel=1
pkgdesc="SELinux userspace (libsepol)"
arch=('i686' 'x86_64')
url="http://userspace.selinuxproject.org"
license=('GPL')
groups=('selinux' 'selinux-userspace')
depends=()
source=(http://userspace.selinuxproject.org/releases/${_release}/${_origname}-${pkgver}.tar.gz)
sha256sums=('290d17f583635a4a5d8a2141511272adf0571c4205cdea38b5a68df20d58a70b')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"

  make
}

package(){
  cd "${srcdir}/${_origname}-${pkgver}"

  make DESTDIR="${pkgdir}"  LIBDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" install

	# /lib -> /usr/lib
	rm "${pkgdir}/usr/lib/libsepol.so"
	cd "${pkgdir}/usr/lib"
	ln -s libsepol.so.1 libsepol.so
}
