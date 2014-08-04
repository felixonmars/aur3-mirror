# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=intellij_idea
_pkgname=idea-IU
pkgver=13.1.4b
_pkgver=135.1230
pkgrel=1
pkgdesc="The most intelligent Java IDE."
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/idea"
license=('custom')
depends=('java-environment')
source=(http://download.jetbrains.com/idea/ideaIU-${pkgver}.tar.gz
         jetbrains-intellij_idea
         jetbrains-idea.desktop
         .AURINFO)
sha256sums=('84660d97c9c3e4e7cfd6c2708f4685dc7322157f1e1c2888feac64df119f0606'
            '71facc43aedfe34d56093ee33a2856511fee6762287eb128c7bbe4c4c8a4d07c'
            '97021bc7c74a2e73474a5bba156ebae693f1bd61d89cf8ec3c6575f9eba1da22'
            SKIP)

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r ${srcdir}/${_pkgname}-${_pkgver}/* "${pkgdir}/opt/${pkgname}"
  if [[ $CARCH = 'i686' ]]; then
    rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
    rm -f "${pkgdir}/opt/${pkgname}/bin/libbreakgen64.so"
    rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
  fi
  if [[ $CARCH = 'x86_64' ]]; then
    rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux.so"
    rm -f "${pkgdir}/opt/${pkgname}/bin/libbreakgen.so"
    rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier"
  fi

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "${startdir}/jetbrains-${pkgname#intellij_}.desktop" "${pkgdir}/usr/share/applications"
  install -m 644 "${pkgdir}/opt/${pkgname}/bin/idea.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m 644 "${srcdir}/${_pkgname}-${_pkgver}/license/IDEA_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt"
  install -m 755 "${startdir}/jetbrains-${pkgname}" "${pkgdir}/usr/bin"
}

