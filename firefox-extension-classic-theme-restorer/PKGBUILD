# Maintainer: Pavel Lymarev <x-user at bk dot ru>

pkgname=firefox-extension-classic-theme-restorer
pkgver=1.3.0
pkgrel=2
pkgdesc='Squared tabs, appmenu, add-on bar, small button view and many more 
'old' features for Firefox 29+'
url='https://addons.mozilla.org/en-US/firefox/addon/classicthemerestorer/?src=api'
arch=('any')
license=('MPL')
depends=('firefox')
makedepends=('unzip')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/472577/addon-472577-latest.xpi")
md5sums=('49ecd6fa560a2f8910cd65b3880779b3')

_extract() {
  [[ -d extract ]] && return || mkdir extract
  unzip -q "${pkgname}.xpi" -d extract
  cd "extract"
}

prepare() {
  _extract
}

pkgver() {
  _extract
  grep -Pom1 '(?<=<em:version>)[[:digit:]\.]*(?=</em:version>)' install.rdf
}

package() {
  cd extract
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$(grep -Pom1 '(?<=<em:id>).*(?=</em:id>)' install.rdf)"
  install -d $dstdir
  cp -r * $dstdir
}

