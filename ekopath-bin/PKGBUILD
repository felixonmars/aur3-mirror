# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: 6xx
# Contributor: csslayer

pkgname=ekopath-bin
_real_name=ekopath
_pkgver=2011-12-04
_pv=4.0.12.1
pkgver=20111204
pkgrel=1
pkgdesc="A high-performance Intel 64 / AMD64 compiler for C99, C++ 2003, Fortran 90/95 and partial 2003"
url="http://pathscale.com/ekopath-compiler-suite"
arch=('x86_64')
license=('unknown')
makedepends=('xdelta')
options=(!strip)
source=(http://c591116.r16.cf2.rackcdn.com/ekopath/nightly/Linux/${_real_name}-${_pkgver}-installer.run
       ekopath.sh
       pathcc.patch)
md5sums=('9788633776f381ac1f04e0a4f84e1792'
         '00c72b71ed4b2f03d1dd84264b405a7a'
         '4816fb9b2d75a847cc922701d05a3321')

build() {
	
  install -dm755 "${pkgdir}"/etc/profile.d
  
  cd "${startdir}"
  
  chmod +x ${_real_name}-${_pkgver}-installer.run
  ./${_real_name}-${_pkgver}-installer.run --mode unattended --disable-components subscriptionmanager --prefix "${pkgdir}"/opt/ekopath
  
  rm -f "${pkgdir}"/opt/${_real_name}/uninstall
  rm -f "${pkgdir}"/opt/${_real_name}/bin/{pathdb,funclookup}
  rm -f "${pkgdir}"/opt/${_real_name}/lib/${_pv}/x8664/coco
  
  mv "${pkgdir}"/opt/ekopath/bin/pathcc "${pkgdir}"/opt/ekopath/bin/pathcc.bak
  xdelta patch "${srcdir}"/pathcc.patch "${pkgdir}"/opt/ekopath/bin/pathcc.bak "${pkgdir}"/opt/ekopath/bin/pathcc
  chmod +x "${pkgdir}"/opt/ekopath/bin/pathcc
  rm -f "${pkgdir}"/opt/ekopath/bin/pathcc.bak
  install -m755 "${srcdir}"/ekopath.sh "${pkgdir}"/etc/profile.d/
  
}
