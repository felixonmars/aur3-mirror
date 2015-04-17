# Maintainer: XZS <d.f.fischer at web dot de>
pkgname=thunderbird-theme-deepdark
pkgver=9.4.2
pkgrel=1
pkgdesc='Smooth dark theme for Thunderbird'
url='https://addons.mozilla.org/de/thunderbird/addon/tt-deepdark/'
arch=('any')
license=('custom:noncommercial')
depends=('thunderbird')
source=("${pkgname}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/331307/platform:2/")
md5sums=('dca222e21df42ab572975072f83a68c7')

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
  local dstdir="$pkgdir/usr/lib/thunderbird/extensions/$(grep -Pom1 '(?<=<em:id>).*(?=</em:id>)' install.rdf)"
  install -d $dstdir
  cp -r * $dstdir
}
