# Maintainer: Jacob <jjnmacmillan@gmail.com>
pkgname=netflix-de
pkgver=1
pkgrel=1
pkgdesc="A simple desktop environment for whatching netflix videos"
arch=('any')
url="https://github.com/jjnm/Netflix-DE/archive/master.zip"
license=('GPL')
depends=(netflix-desktop openbox)
source=(https://github.com/jjnm/Netflix-DE/archive/master.zip)
md5sums=(b84ca708820fe5e49e2e5ed79b4a85ae) #generate with 'makepkg -g'

package() {
	cd $srcdir/Netflix-DE-master
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/xsessions
	mv ./netflixDE.sh $pkgdir/usr/bin/
	mv ./netflix.desktop $pkgdir/usr/share/xsessions
}
