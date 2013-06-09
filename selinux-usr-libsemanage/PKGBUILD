# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)                 
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-usr-libsemanage
_origname=libsemanage
_release=20130423
pkgver=2.1.10
pkgrel=1
pkgdesc="SELinux userspace (libsemanage including python bindings)"
arch=('i686' 'x86_64')
url="http://userspace.selinuxproject.org"
license=('GPL')
groups=('selinux' 'selinux-userspace')
depends=('ustr' 'selinux-usr-libselinux>=2.1.0' 'python2')
conflicts=('selinux-usr-libsemanage-python')
options=(!emptydirs)
source=(http://userspace.selinuxproject.org/releases/${_release}/${_origname}-${pkgver}.tar.gz)
sha256sums=('de2e8077245581e94576276f54e80a53c23c28d6961d2dfbe2f004eaba452e91')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"

  # Set python version
  sed -i -e "s/ python/ python2/" "src/Makefile"

  make 

  # Build python wrapper, which is needed for semanage tool
  make pywrap
}

package(){
  cd "${srcdir}/${_origname}-${pkgver}"

  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" install
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" install-pywrap
}
