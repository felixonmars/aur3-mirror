# Maintainer: Max Fierke (m4xm4n) <max@maxfierke.com>
pkgname=xtod
pkgver=1
pkgrel=1
pkgdesc="A tetromino game for X that simulates the effect of hallucinogens."
arch=('i686' 'x86_64')
url="http://pineight.com/pc/"
license=('GPL')
depends=('allegro4')
source=('https://d1cxvcw9gjxu2x.cloudfront.net/projects/1038#wintod.zip')
md5sums=('228c9076cd6b350368f776644fe099e3')

build() {
	cd "${srcdir}"
	sed -n '/<small>/,/<\/small>/p' readme.txt | cut -f2 -d'>'| cut -f1 -d'<' > LICENSE
	gcc -O3 *.c `allegro-config --libs` -o xtod
}

package() {
	cd "${srcdir}"
	install -Dm755 xtod "$pkgdir/usr/bin/xtod"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
 

