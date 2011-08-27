# Maintainer: Jason Axelson (bostonvaulter <at> gmail <dot> com)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-usr-checkpolicy-old
_origname=checkpolicy
_release=20080909
pkgver=1.34.7
pkgrel=1
pkgdesc="SELinux userspace (checkpolicy) compatabile with CentOS 5.4"
arch=('i686' 'x86_64')
url="http://userspace.selinuxproject.org"
license=('GPL')
depends=('selinux-usr-libsepol-old>=1.16.14' 'selinux-usr-libselinux-old>=1.34.15')
makedepends=('selinux-flex')
options=(!emptydirs)
source=(http://userspace.selinuxproject.org/releases/${_release}/stable/${_origname}-${pkgver}.tar.gz)
md5sums=('6a825bd0cae023b78057ee7859275ca1')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"
  make || return 1
  make DESTDIR=${pkgdir} install
}
