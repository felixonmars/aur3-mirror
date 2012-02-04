# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

_appname="sam1"
pkgname="secret-agent-1"
pkgdesc="Side-scrolling platform game (uses DOSBox)"
pkgver=1.0a
pkgrel=1
arch=(any)
license=("custom:shareware")
url="http://www.3drealms.com/agent/"
depends=("modfs-git" "dosbox")
makedepends=("dynamite-git")
source=("ftp://ftp.3drealms.com/share/1sa${pkgver//.}.zip"
        "${_appname}.desktop"
        "${_appname}.png"
        "lib${_appname}.sh"
        "${_appname}.sh"
        "01-user.conf"
        "99-base.conf")
md5sums=('fac0faf64a90157744cee5ddb9b0b08c'
         'e3cb8e4db6575475c0cfa2e867e7c2e9'
         '36091ddac5d09ca8936631265ac6f4c5'
         'f8b7b1f43d5109195f9e8126bd3ad608'
         '504634bff8e70728af16d0b18ce24cf1'
         'c1549ac03b636273288afaf4046f3ad0'
         'fd55be3fe19a266b3d02044db2e845b1')
install="${pkgname}.install"

build() {
  # Extract original resources
  cd "${srcdir}"
  mkdir -p shr
  local shr="samsw${pkgver//.}.shr"
  cd shr
  id-shr-extract ../"${shr^^*}"
}

package() {
  # Copy original resources
  cd "${srcdir}/shr"
  local i
  for i in sam1* order*; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/games/${_appname}/base/${i}"
  done

  # License
  install -Dm644 "${srcdir}/shr/vendor.doc" "${pkgdir}/usr/share/licenses/${pkgname}/vendor.doc"

  # Modfs
  install -Dm644 "${srcdir}/01-user.conf" "${pkgdir}/etc/${_appname}.d/01-user.conf"
  install -Dm644 "${srcdir}/99-base.conf" "${pkgdir}/etc/${_appname}.d/99-base.conf"

  # Scripts, launchers and icons
  install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm644 "${srcdir}/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"
  install -Dm644 "${srcdir}/lib${_appname}.sh" "${pkgdir}/usr/lib/lib${_appname}.sh"
  install -Dm755 "${srcdir}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"
}
