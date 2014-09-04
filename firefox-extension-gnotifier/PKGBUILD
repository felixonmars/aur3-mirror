# Maintainer: XZS <d.f.fischer at web dot de>
pkgname=firefox-extension-gnotifier
pkgver=1.8.5
pkgrel=1
pkgdesc='Add-on for Firefox and Thunderbird that enable integration with GNOME native notification system.'
url='https://addons.mozilla.org/en-US/firefox/addon/gnotifier/'
arch=('any')
license=('GPL3')
depends=('libnotify')
optdepends=(
  'firefox: for firefox plugin'
  'thunderbird: for thunderbird plugin'
)
options=('!emptydirs')
source=("https://addons.mozilla.org/firefox/downloads/file/265826/gnotifier-${pkgver}-tb+fx-linux.xpi")
md5sums=('a3074a98893c9b09e4415a959b378758')

build() {
  cd "$srcdir"
  [[ -d $pkgname-extract ]] || mkdir $pkgname-extract
  unzip -q -d $pkgname-extract gnotifier-$pkgver-tb+fx-linux.xpi
}

package() {
  cd "$srcdir/$pkgname-extract"
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local fxdir="/usr/lib/firefox/browser/extensions/$emid"
  local fxdstdir="${pkgdir}${fxdir}"
  local tbdstdir="$pkgdir/usr/lib/thunderbird/extensions"
  install -d "$fxdstdir" "$tbdstdir"
  mv * $fxdstdir
  ln -s "$fxdir" "$tbdstdir/$emid"
}
