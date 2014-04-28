# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
pkgname='element4l-hib'
pkgdesc='An immersive and experimental platformer with a focus on flow and smooth gameplay'
url='http://i-illusions.com/element4l/'
pkgver=Beta
pkgrel=1
license=('custom')
arch=('i686' 'x86_64')
depends=('mono' 'gtk2' 'glu')
source=("hib://Element4l-Linux-${pkgver}.zip"
        'element4l.desktop')
md5sums=('443543e555cb01051e514139ddb1244a'
         '929efc3157885f9e9701ffbff86435a4')

package() {
  cd "${srcdir}/Element4l-Linux"

  if [[ "${CARCH}" == 'i686' ]]; then
      _arch='x86'
      _otherarch='x86_64'
  else
      _arch='x86_64'
      _otherarch='x86'
      depends+=('gcc-libs-multilib')
  fi

  rm -r "element4l_Data/Plugins/${_otherarch}" \
        "element4l_Data/Mono/${_otherarch}" \
        "element4l.${_otherarch}"

  _installdir='opt/element4l'
  install -d -m755 "${pkgdir}"/{usr/bin,opt/element4l}
  install -m755 "element4l.${_arch}" "${pkgdir}/${_installdir}/"

  ln -s "/${_installdir}/element4l.${_arch}" "${pkgdir}/usr/bin/element4l"

  install -Dm644 'element4l_Data/Resources/UnityPlayer.png' "${pkgdir}/usr/share/pixmaps/element4l.png"
  cp -a --no-preserve=ownership 'element4l_Data' "${pkgdir}/${_installdir}/"

  install -Dm644 "${srcdir}/element4l.desktop" "${pkgdir}/usr/share/applications/element4l.desktop"
}

