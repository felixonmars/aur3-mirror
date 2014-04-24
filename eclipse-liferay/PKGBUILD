# Maintainer: Federico Budassi <federico.budassi at gmail.com>
# Contributor: idovitz <ido at vanverseveld.org>

pkgname=eclipse-liferay
pkgver=2.1.0_GA1
pkgrel=2
arch=('any')
pkgdesc="Eclipse plugin for Liferay Portal Development"
license=('LGPL')
url="http://www.liferay.com"
depends=('eclipse>=3.7.0' 'eclipse-wtp>=3.5.0')
optdepends=('eclipse-android')
options=('!strip')
source=("http://sourceforge.net/projects/lportal/files/Liferay%20IDE/2.1.0%20GA1/liferay-ide-updatesite-2.1.0-ga1-201403281241.zip/download#")
md5sums=('2612f4896bfb815cc91a5fb34d01a8d8')

package() {
  _tools="${pkgdir}/usr/share/eclipse/dropins/liferay-ide-tools/eclipse"
  _mobile="${pkgdir}/usr/share/eclipse/dropins/liferay-ide-mobile/eclipse"
  _maven="${pkgdir}/usr/share/eclipse/dropins/liferay-ide-maven/eclipse"

  cd "${srcdir}"

  # Tools
  cd tools
  for _f in features/*.jar; do
    echo ${_f}
    _dir="${_tools}/${_f/.jar}"
    mkdir -p "${_dir}"
    bsdtar -xf "${_f}" -C "${_dir}"
  done
  
  for _p in plugins/*.jar; do
    echo ${_p}
    install -Dm644 "${_p}" "${_tools}/${_p}"
  done
  cd ..

  # Mobile
  cd mobile
  for _f in features/*.jar; do
    _dir="${_mobile}/${_f/.jar}"
    mkdir -p "${_dir}"
    bsdtar -xf "${_f}" -C "${_dir}"
  done
  
  for _p in plugins/*.jar; do
    install -Dm644 "${_p}" "${_mobile}/${_p}"
  done
  cd ..

  # Maven
  cd maven
  for _f in features/*.jar; do
    _dir="${_maven}/${_f/.jar}"
    mkdir -p "${_dir}"
    bsdtar -xf "${_f}" -C "${_dir}"
  done
  
  for _p in plugins/*.jar; do
    install -Dm644 "${_p}" "${_maven}/${_p}"
  done
  cd ..
}
