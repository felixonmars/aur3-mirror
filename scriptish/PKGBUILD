# Contributor: mutantmonkey <mutantmonkey@gmail.com>
pkgname=scriptish
pkgver=0.1.3
_ffver=5.0
pkgrel=1
pkgdesc="Firefox add-on which blocks ads and banners"
arch=('any')
url="http://github.com/erikvold/scriptish"
license=('MIT')
depends=('firefox>='${_ffver})
source=("https://addons.mozilla.org/firefox/downloads/latest/231203/addon-231203-latest.xpi")
md5sums=('36aa88c29b5308de456558bc9a5b1a5f')
sha256sums=('6663905f01593fd39894045c9be7c5515ba51dbe0fe3b2b25fdbd08a98b1a35d')

build() {
  cd $srcdir

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  installdir=$pkgdir/usr/lib/firefox-${_ffver}/extensions/$emid

  install -d ${installdir} || return 1
  cp -a * ${installdir} || return 1
}
