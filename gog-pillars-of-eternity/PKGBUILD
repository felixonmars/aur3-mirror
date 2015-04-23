# Maintainer : Szymon Szydełko <aur [] szydelko [] pw>

# Download the game from GOG and put it in the same directory as the PKGBUILD,
# it'll pick up the file

pkgname=gog-pillars-of-eternity
_pkgname=pillars-of-eternity
_original="Pillars of Eternity"
pkgver=1.2.0.3
pkgrel=2
pkgdesc="A party-based role-playing video game inspired by the Infinity Engine games. GOG version"
url="http://eternity.obsidian.net/game"
license=("custom")
groups=("games")
arch=("x86_64")
depends=(expat glu libdrm libx11 libxau libxcb libxcursor libxdamage libxdmcp libxext libxfixes libxrandr libxrender libxshmfence libxxf86vm mesa mesa-libgl)
source=(gog://gog_pillars_of_eternity_1.2.0.3.tar.gz
        "${_pkgname}"
        "${_pkgname}.desktop")
sha256sums=('bcebd50e524cb95b7805f2f080ec5894c3f12ee96d6270fad6a027829395d4d2'
            '083e99ffa97d7c95dc8d7c9ce3cf6273a4431f75831976925cbf49f171658ca7'
            '436572c4eb8e324ea44a9272a4ca7202b92c56e78c1bc72fca48490a8a54c248')
options=('!strip')
PKGEXT=.pkg.tar

package() {
  export LC_ALL=C
  export LOCALE=C
  mkdir -p "${pkgdir}"/opt/gog/${_pkgname}/
  # mv "${srcdir}""/Pillars of Eternity"/* "${pkgdir}"/opt/gog/pillars-of-eternity/
  cp -r --reflink=auto  "${srcdir}"/"${_original}"/* "${pkgdir}"/opt/gog/${_pkgname}

  # launcher
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # licence
  install -Dm644 "${pkgdir}/opt/gog/${_pkgname}/docs/End User License Agreement.txt" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # desktop entry
  install -Dm644 "${srcdir}/${_pkgname}".desktop "${pkgdir}"/usr/share/applications/${_pkgname}-primary.desktop

  # install -Dm644 "${srcdir}"/"${_original}"/support/${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
  # install -Dm644 "${srcdir}"/"${_original}"/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

}
