# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-usr-checkpolicy
_origname=checkpolicy
_release=20130423
pkgver=2.1.12
pkgrel=1
pkgdesc="SELinux userspace (checkpolicy)"
arch=('i686' 'x86_64')
url="http://userspace.selinuxproject.org"
license=('GPL')
groups=('selinux' 'selinux-userspace')
depends=('selinux-usr-libsepol>=2.1.0' 'selinux-usr-libselinux>=2.1.0')
makedepends=('selinux-flex')
options=(!emptydirs)
source=(http://userspace.selinuxproject.org/releases/${_release}/${_origname}-${pkgver}.tar.gz)
sha256sums=('e6a0ac539b74859b4262b317eb90d9914deb15e7aa509659f47724d50fe2ecc6')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"

  make
}

package(){
  cd "${srcdir}/${_origname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
