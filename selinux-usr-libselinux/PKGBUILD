# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Angelux (xangelux) (xangelux <at> gmail <dot> com)

pkgname=selinux-usr-libselinux
_origname=libselinux
_release=20130423
pkgver=2.1.13
pkgrel=2
pkgdesc="SELinux userspace (libselinux including python bindings)"
arch=('i686' 'x86_64')
url="http://userspace.selinuxproject.org"
license=('GPL')
groups=('selinux' 'selinux-userspace')
depends=('selinux-usr-libsepol>=2.1.0' 'glibc' 'python2' 'pcre')
makedepends=('swig')
conflicts=('selinux-usr-libselinux-python')
options=(!emptydirs)
source=(http://userspace.selinuxproject.org/releases/${_release}/${_origname}-${pkgver}.tar.gz
        remove-fedora-specific-policy-path.patch)
sha256sums=('57aad47c06b7ec18a76e8d9870539277a84cb40109cfdcf70ed3260bdb04447a'
            '2fd13d940ac7bcfcccb211898c34562967ab636308f133f8547aacb6c111c294')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"

	CFLAGS="${CFLAGS} -lpcre -pthread"

  # Add gentoo patches for fedora specific functions
  patch -p1 < "${srcdir}/remove-fedora-specific-policy-path.patch"

  # Set python version
  sed -i -e "s/ python/ python2/" src/Makefile
  sed -i -e "s/PYLIBDIR ?= \$(LIBDIR)\/\$(PYLIBVER)/PYLIBDIR ?=\$(LIBDIR)\/python2.7/g" "src/Makefile"

  # /bin, /sbin, /usr/sbin -> /usr/bin
  sed -i -e "s/USRBINDIR ?= \$(PREFIX)\/sbin/USRBINDIR ?= \$(PREFIX)\/bin/" "utils/Makefile"
  sed -i -e "s/SBINDIR ?= \$(DESTDIR)\/sbin/SBINDIR ?= \$(PREFIX)\/bin/" "utils/Makefile"

  # /lib -> /usr/lib
  sed -i -e "s/SHLIBDIR ?= \$(DESTDIR)\/lib/SHLIBDIR ?= \$(PREFIX)\/lib/" src/Makefile
  make 

  # Build python wrapper, which is needed for semanage tool
  make pywrap
}

package(){
  cd "${srcdir}/${_origname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-pywrap

  # /lib -> /usr/lib
	rm "${pkgdir}/usr/lib/libselinux.so"
	cd "${pkgdir}/usr/lib/"
	ln -s libselinux.so.1 libselinux.so
}
