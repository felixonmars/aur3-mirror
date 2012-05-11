#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=ywriter
pkgver=5.1.9.7
pkgrel=1
pkgdesc="Free novel writing program."
arch=(any)
url="http://www.spacejock.com/yWriter5.html" 
license=("Freeware")
depends=('mono-basic' 'ttf-ms-fonts')
source=(http://www.spacejock.com/files/yWriter5.zip ywriter.sh)
md5sums=('47c3c690a3245058e1af0d0d08f8a966'
         '8983d096724b468319cb682af927ee3b')

build() { 
  cd "$srcdir"
	install -d "$pkgdir"/opt
  cp -r yWriter5/bin "$pkgdir"/opt/ywriter
  install -d "$pkgdir"/usr/bin
  cp ywriter.sh "$pkgdir"/usr/bin/ywriter
}

