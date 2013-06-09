# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)                 
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-usr-sepolgen
_origname=sepolgen
_release=20130423
pkgver=1.1.9
pkgrel=1
pkgdesc="SELinux userspace (sepolgen)"
groups=('selinux' 'selinux-userspace')
arch=('i686' 'x86_64')
url="http://userspace.selinuxproject.org"
license=('GPL')
depends=('python2')
source=(http://userspace.selinuxproject.org/releases/${_release}/${_origname}-${pkgver}.tar.gz)
sha256sums=('8a1c6d3a78c9b6ad3555c74def555f65a62950bf21c111c585bfc382fec3a645')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"

  # Set python version
  sed -i -e "s/ python/ python2/" "src/sepolgen/Makefile"

  make
}

package(){
  cd "${srcdir}/${_origname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
