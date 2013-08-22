# Maintainer: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
pkgname=cogscrobbler-hg
_pkgname=cogscrobbler
pkgver=469.0a8c6764fa8b
pkgrel=1
pkgdesc="because those vinyls aren't going to scrobble themselves"
arch=('any')
url="http://cogscrobbler.ulfurinn.net/"
license=('GPL')
depends=('qt4' 'ruby')
makedepends=('mercurial' 'boost')
provides=('cogscrobbler')
conflicts=('cog-scrobbler-svn')
replaces=('cog-scrobbler-svn' 'cog-scrobbler' 'cogscrobbler')
source=("cogscrobbler::hg+http://hg.ulfurinn.net/cog-scrobbler")
md5sums=("SKIP") #generate with 'makepkg -g'

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake-qt4 cogscrobbler.pro INSTALL=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  echo "[Desktop Entry]" > ${_pkgname}.desktop
  echo "Version=${pkgver}" >> ${_pkgname}.desktop
  echo "Encoding=UTF-8" >> ${_pkgname}.desktop
  echo "MultipleArgs=false" >> ${_pkgname}.desktop
  echo "Terminal=0" >> ${_pkgname}.desktop
  echo "Icon=/usr/share/${_pkgname}/${_pkgname}.png" >> ${_pkgname}.desktop
  echo "Exec=${_pkgname}" >> ${_pkgname}.desktop
  echo "Categories=Application;AudioVideo;" >> ${_pkgname}.desktop
  echo "Type=Application" >> ${_pkgname}.desktop
  echo "Name=CogScrobbler" >> ${_pkgname}.desktop

  install -d "${pkgdir}/usr/bin/"
  cp -Rl ${_pkgname}  "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/res/extract.png" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.png"
}
