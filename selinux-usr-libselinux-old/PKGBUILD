# Maintainer: Jason Axelson (bostonvaulter <at> gmail <dot> com)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-usr-libselinux-old
_origname=libselinux
_release=20080909
pkgver=1.34.15
pkgrel=1
pkgdesc="SELinux userspace (libselinux including python bindings) compatabile with CentOS 5.4"
arch=(i686 x86_64)
url="http://userspace.selinuxproject.org"
license=('GPL')
depends=('selinux-usr-libsepol-old>=1.16.14')
conflicts=('selinux-usr-libselinux-python')
options=(!emptydirs)
source=(http://userspace.selinuxproject.org/releases/${_release}/stable/${_origname}-${pkgver}.tar.gz)
md5sums=('f60bc5d07e41ac47ef4577bdb099fab0')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"
  make || return 1
  make DESTDIR=${pkgdir} install

  # Build python wrapper, which is needed for semanage tool
  make pywrap || return 1
  make DESTDIR="${pkgdir}" install-pywrap

}
