# Maintainer: Alexander Baldeck <alexander.baldeck@icomedias.com>
pkgname=snortrules
pkgver=2.4
pkgrel=2
pkgdesc="A generic ruleset for use with Snort"
depends=('snort>=2.4.0')
source=(http://www.snort.org/pub-bin/downloads.cgi/Download/vrt_pr/$pkgname-pr-$pkgver.tar.gz)
url="http://www.snort.org"

build() {
  cd $startdir/src/rules
  mkdir -p $startdir/pkg/etc/snort/rules
  for fn in `find -type f`; do
    install -D -m644 $fn $startdir/pkg/etc/snort/rules/$fn
  done	  
} 
md5sums=('35d9a2486f8c0280bb493aa03c011927')
