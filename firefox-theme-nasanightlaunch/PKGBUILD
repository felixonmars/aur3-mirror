# Maintainer: XZS
# Adapted from PKGBUILDs for firefox themes by Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=firefox-theme-nasanightlaunch
pkgdesc="Dark theme for Firefox. Inspired by the night launch of STS-116."
pkgver=0.6.20150330
pkgrel=1
arch=('any')
url="http://home.comcast.net/~username54321/starfield/index.html"
depends=("firefox")
license=('custom')
source=("$pkgname.xpi::https://addons.mozilla.org/firefox/downloads/latest/4908/")
md5sums=('20f5e5deb054ca27bee2baa39a783202')

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
