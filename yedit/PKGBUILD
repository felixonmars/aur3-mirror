#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=yedit
pkgver=2.0.0.8
pkgrel=1
pkgdesc="Simple text editor with frequent auto-backups and a countdown word counter."
arch=(any)
url="http://www.spacejock.com/yEdit2.html"
license=("Freeware")
depends=('mono-basic' 'ttf-ms-fonts')
source=(http://www.spacejock.com/files/yEdit2Beta.zip yedit.sh)
md5sums=('8691515e68d7827eac17156b473483d3'
         '51d07a5b8016313d8743bbc624e7d254')

build() { 
  cd "$srcdir"
	install -d "$pkgdir"/opt
  cp -r yEdit2/bin "$pkgdir"/opt/yedit
  install -d "$pkgdir"/usr/bin
  cp yedit.sh "$pkgdir"/usr/bin/yedit
}

