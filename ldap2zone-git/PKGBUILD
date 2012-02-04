# Maintainer: archme

pkgbase=ldap2zone
pkgname=ldap2zone-git
pkgver=20110516
pkgrel=1
pkgdesc="Tool to export fusiondirectory dns ldap-entries to bind zone-files"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.fusiondirectory.org/"
depends=('bind')
makedepends=('git')
options=()
install=${pkgbase}.install
source=('ldap2zone.default')
md5sums=('715b7d5de2ba481d9bc9d77276ba38f5')


_gitroot="http://git.fusiondirectory.org/code/main/goto2.git/"
_gitname="${pkgbase}"


build() {
  cd ${srcdir}/

  msg "Connecting to the GIT server...."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
      cd ${_gitname}
      git pull origin
      msg "The local files are updated..."
  else
      git clone ${_gitroot} ${_gitname}
  fi
  
  msg "GIT checkout done."


  msg "Starting make..."

  cd "${srcdir}/${pkgbase}/${pkgbase}"

  make || return 1
}

package_ldap2zone-git() {
  cd "${srcdir}/${pkgbase}/${pkgbase}"

  install -D -m755 ./ldap2bind ${pkgdir}/usr/sbin/ldap2bind
  install -D -m755 ./ldap2zone ${pkgdir}/usr/sbin/ldap2zone
  install -D -m644 ${srcdir}/ldap2zone.default ${pkgdir}/etc/default/ldap2zone
}
