# Maintainer: Jason Axelson (bostonvaulter <at> gmail <dot> com)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-usr-policycoreutils-old
_origname=policycoreutils
_release=20080909
pkgver=1.34.16
pkgrel=1
pkgdesc="SELinux userspace (policycoreutils) compatabile with CentOS 5.4"
arch=('i686' 'x86_64')
url="http://userspace.selinuxproject.org"
license=('GPL')
depends=('selinux-usr-libsemanage-old>=1.10.9' 'selinux-usr-libselinux-old>=1.34.15')
options=(!emptydirs)
source=(http://userspace.selinuxproject.org/releases/${_release}/stable/${_origname}-${pkgver}.tar.gz)
md5sums=('09814a5febe457a6f653e1f5e63e299b')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"

  sed -i 's|/usr/bin/install|install|g' po/Makefile
  sed -i 's|-Werror||g' setfiles/Makefile

  make || return 1
  make DESTDIR=${pkgdir} install
}
