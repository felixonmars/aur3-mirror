# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=clion-eap
_pkgname=clion
pkgbuild=138.1965.18
pkgver=${pkgbuild}
pkgrel=1
pkgdesc="C/C++ IDE. 60-day evaluation."
arch=('i686' 'x86_64')
options=(!strip)
url="http://www.jetbrains.com/${_pkgname}"
license=('custom')
depends=('cmake' 'gdb' 'java-environment>=6')
source=(http://download.jetbrains.com/cpp/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('c71700cc544f4a6aeb3085425e49dbe31793550a3721c91a19f93bc729911696056153e522e76c4e7e204550ee714a8b16d8380eda2504ded5556ef43da23ede')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/opt/${pkgname} || return 1
  cp -R ${srcdir}/${_pkgname}-${pkgbuild}/* ${pkgdir}/opt/${pkgname} || return 1
  if [[ $CARCH = 'i686' ]]; then
     rm -f ${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so
     rm -f ${pkgdir}/opt/${pkgname}/bin/fsnotifier64
  fi
  if [[ $CARCH = 'x86_64' ]]; then
     rm -f ${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux.so
     rm -f ${pkgdir}/opt/${pkgname}/bin/fsnotifier
  fi

(
cat <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=${pkgname}
Exec="/usr/bin/${pkgname}" %f
Icon=${pkgname}
Comment=${pkgdesc}
GenericName=${_pkgname}
Categories=Development;IDE;
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-${_pkgname}
EOF
) > ${startdir}/${pkgname}.desktop

  mkdir -p ${pkgdir}/usr/bin/ || return 1
  mkdir -p ${pkgdir}/usr/share/applications/ || return 1
  mkdir -p ${pkgdir}/usr/share/pixmaps/ || return 1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -m 644 ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -m 644 ${pkgdir}/opt/${pkgname}/bin/${_pkgname}.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
  install -m 644 ${srcdir}/${_pkgname}-${pkgbuild}/license/CLion_Preview_License.txt ${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt
  ln -s /opt/${pkgname}/bin/${_pkgname}.sh "$pkgdir/usr/bin/${pkgname}"
}
