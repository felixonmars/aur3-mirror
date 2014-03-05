# Maintainer: Sizhao LIU <sizhaoliu@talend.com>
# Credits: vdemeester, Ichimonji10 

# Choose your prefered site. The default is US.
_mirror=('http://talend.dreamhosters.com') # US server
#_mirror=('http://download-mirror1.talend.com') # Europe server

pkgname=talend-open-studio-di
_pkgname=TOS_DI
pkgver=5.4.1
_pkgver=r111943
pkgrel=1
pkgdesc='Talend Open Studio for Data Integration'
arch=(i686 x86_64)
url=('http://www.talend.com')
license=(GPL2)
depends=(lib32-glibc java-environment python)
options=('!strip' '!emptydirs')
source=("${_mirror}/tos/release/V${pkgver}/${_pkgname}-${_pkgver}-V${pkgver}.zip"
        "${_pkgname}.desktop")
sha256sums=('77914a7b76508b086e95e61bd5dac4e7b90cb5f63a9ad36d76a1582d7f634579'
            'd9aeef3fd9cafb055dffcd549b9175ae642a5f88b3549125c71cdc7ed2dc8568')

prepare() {
  # Remove all non-Linux files and directories.
  cd "${srcdir}/${_pkgname}-${_pkgver}-V${pkgver}" \
  && rm -rf  *macosx* *solaris* *gtk-ppc* *win*
  find . -type f \( \
    -name '*macosx*' -o \
    -name '*solaris*' -o \
    -name '*gtk-ppc*' -o \
    -name '*win32*' \
  \) -exec rm '{}' \;
}

package(){
  # Create destination directories.
  install -dm755 \
    "${pkgdir}/opt" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/applications"

  # Copy files to destination directories.
  cp -Rp \
    "${srcdir}/${_pkgname}-${_pkgver}-V${pkgver}" \
    "${pkgdir}/opt/${_pkgname}-${_pkgver}-V${pkgver}"
  install -m 0755 \
    "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/"

  # Link application icon, and link executable based on architecture.
  ln -s \
    "/opt/${_pkgname}-${_pkgver}-V${pkgver}/plugins/org.talend.rcp.branding.tos_${pkgver}.${_pkgver}/icons/appli_32x32.gif" \
    "${pkgdir}/opt/${_pkgname}-${_pkgver}-V${pkgver}/icon.gif"
  ln -s \
    "/opt/${_pkgname}-${_pkgver}-V${pkgver}/${_pkgname}-linux-gtk-${CARCH//i6/x}" \
    "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/opt/${_pkgname}-${_pkgver}-V${pkgver}/${_pkgname}-linux-gtk-${CARCH//i6/x}"
}

# vim:set ts=2 sw=2 et:
