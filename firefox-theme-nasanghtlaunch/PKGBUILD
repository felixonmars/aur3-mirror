# Maintainer: XZS
# Adapted from PKGBUILDs for firefox themes by Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=firefox-theme-nasanghtlaunch
pkgdesc="Dark theme for Firefox. Inspired by the night launch of STS-116."
pkgver=0.6.20150106
_file_id=190992
pkgrel=1
arch=('any')
url="http://home.comcast.net/~username54321/starfield/index.html"
depends=("firefox")
license=('custom')
source=("$pkgname.xpi::https://addons.mozilla.org/firefox/downloads/latest/4908/")
md5sums=('0ba453c3fafeca59620fda13010286c2')

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
