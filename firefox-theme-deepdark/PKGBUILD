# Maintainer: XZS <d.f.fischer at web dot de>
pkgname=firefox-theme-deepdark
pkgver=12.0
pkgrel=1
pkgdesc='Smooth dark theme for Firefox'
url='https://addons.mozilla.org/en-us/firefox/addon/ft-deepdark/'
arch=('any')
license=('custom:noncommercial')
depends=('firefox')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/295337/platform:2/")
md5sums=('78f55cc54ce4678319446512b45e2262')

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
