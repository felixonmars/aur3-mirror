# Maintainer: Jason Axelson (bostonvaulter <at> gmail <dot> com)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-usr-libsepol-old
_origname=libsepol
_release=20080909
pkgver=1.16.14
pkgrel=2
pkgdesc="SELinux userspace (libsepol) compatabile with CentOS 5.4"
arch=('i686' 'x86_64')
url="http://userspace.selinuxproject.org"
license=('GPL')
depends=()
source=(http://userspace.selinuxproject.org/releases/${_release}/stable/${_origname}-${pkgver}.tar.gz)
md5sums=('a4e7cc1b853bd78eb92f7f94509be1bd')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"
  make || return 1
  make DESTDIR=${pkgdir} install
}
