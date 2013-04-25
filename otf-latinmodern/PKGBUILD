# Contributor: titiwu
pkgname=otf-latinmodern
pkgver=2.004
pkgrel=2
pkgdesc="Latin modern fonts collection"
arch=(any)
url="http://www.gust.org.pl/projects/e-foundry/latin-modern"
license=('GFL')
depends=(fontconfig xorg-fonts-encodings xorg-font-utils)
makedepends=unzip
install=otf-latinmodern.install
source=(http://www.gust.org.pl/projects/e-foundry/latin-modern/download/lm${pkgver}otf.zip)
md5sums=('0bc81a83fe37416b67b69ab3a6593ef5')

build() {

cd $startdir/src/
mkdir -p $startdir/pkg/$pkgname/usr/share/fonts/TTF
install -m 0644 *.otf $startdir/pkg/$pkgname/usr/share/fonts/TTF
}

# vim:set ts=2 sw=2 et:
