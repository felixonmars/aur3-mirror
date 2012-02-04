# Contributor: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=jsoftware-platimg-addon
pkgver=1.0.9
pkgrel=1
pkgdesc="platform neutral image I/O utilities for J programming language"
arch=('any')
url="http://www.jsoftware.com"
license=('custom:jsoftware')
depends=('jsoftware')
source=(http://www.jsoftware.com/jal/j602/addons/media_platimg_${pkgver}_linux.tar.gz)
md5sums=('d03a5262ee23ea8c4e529799bfe8f54f')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/j/addons
  cp -a media $startdir/pkg/usr/lib/j/addons/
}
