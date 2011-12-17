# Contributor: Giniu <gginiu@gmail.com>
pkgname=sonar-st
pkgver=3.0.2.2
pkgrel=1
pkgdesc="A manuscript submission tracking (st) program."
arch=(i686 x86_64)
url="http://www.spacejock.com/Sonar3.html"
license="Freeware"
depends=('mono-basic' 'ttf-ms-fonts')
source=(http://www.spacejock.com/files/Sonar3.zip sonar.sh)
md5sums=('0771bc95c9875e52c48eb7e6ba1be65d'
         '1b96cd03cf07ae452b086ca5a271a6ff')

build() { 
  cd "$srcdir"
	install -d "$pkgdir"/opt
  cp -r Sonar3/bin "$pkgdir"/opt/sonar
  install -d "$pkgdir"/usr/bin
  cp sonar.sh "$pkgdir"/usr/bin/sonar
}

