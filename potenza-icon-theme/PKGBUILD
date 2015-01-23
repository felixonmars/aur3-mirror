# Maintainer: Marius (marius AT nsa DOT ro)

pkgname=potenza-icon-theme
pkgver=2.0
pkgrel=1
pkgdesc="A wonderful iconset made by the Mystras team"
#url="http://gnome-look.org/content/show.php?content=155482"
url="http://xfce-look.org/content/show.php/Potenza+2.0?content=166916"
license=('GPL3')
arch=('any')
makedepends=()
options=(!strip)
#source=("http://localizator.googlecode.com/files/Potenza.tar.gz")
source=("https://github.com/AlessandroBompadre/Potenza/archive/master.zip")
sha512sums=('cc9d4f4612f8f28d2a0afd7cbcbf731f199f3233485d948a12768bea5fdbdab0c93ce97506548c96311a27eb1923c23bc36174b267db6f23f362437452039215')

package() {
	cd "$srcdir/Potenza-master"
	mkdir -p "$pkgdir"/usr/share/icons
	cp -rf Potenza  "$pkgdir"/usr/share/icons/
	#find "$pkgdir/usr/share/icons/Potenza" -type d -exec chmod 755 {} \;
	#find "$pkgdir/usr/share/icons/Potenza" -type f -exec chmod 644 {} \;
}

package() {
       cd "$srcdir/Potenza-master"
       find "$pkgdir/usr/share/icons/Potenza" -type d -exec chmod 755 {} \;
       find "$pkgdir/usr/share/icons/Potenza" -type f -exec chmod 644 {} \;
}