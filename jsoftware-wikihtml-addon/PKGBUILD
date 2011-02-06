# Contributor: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=jsoftware-wikihtml-addon
pkgver=1.0.26
pkgrel=1
pkgdesc="online documentation from j wiki"
arch=('any')
url="http://www.jsoftware.com"
license=('custom:jsoftware')
depends=('jsoftware')
source=(http://www.jsoftware.com/jal/j602/addons/docs_wikihtml_${pkgver}_linux.tar.gz)
md5sums=('185a170caec7011aeaea72dfab0dc7a5')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/j/addons
  cp -a docs $startdir/pkg/usr/lib/j/addons/
}
