# Maintainer: Jason Axelson (bostonvaulter <at> gmail <dot> com)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-usr-libsemanage-old
_origname=libsemanage
_release=20080909
pkgver=1.10.9
pkgrel=1
pkgdesc="SELinux userspace (libsemanage including python bindings) compatabile with CentOS 5.4"
arch=('i686' 'x86_64')
url="http://userspace.selinuxproject.org"
license=('GPL')
depends=('ustr' 'selinux-usr-libselinux-old>=1.34.15')
conflicts=('selinux-usr-libsemanage-python')
options=(!emptydirs)
source=(http://userspace.selinuxproject.org/releases/${_release}/stable/${_origname}-${pkgver}.tar.gz)
md5sums=('a2eecb5e0a419cef7f39066378e59dcb')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"
  make || return 1
  make DESTDIR=${pkgdir} install
  # Build python wrapper, which is needed for semanage tool
  make pywrap || return 1
  make DESTDIR="${pkgdir}" install-pywrap
}
