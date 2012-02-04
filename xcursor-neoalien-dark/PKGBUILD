# Contributor: Malina  <mali@irc>
# Maintainer: Malina  <mali@irc>
pkgname=xcursor-neoalien-dark
pkgver=1
pkgrel=1
pkgdesc="Neo Alien Dark Theme. Original CursorXP theme by TYCUS"
arch=('any')
license=('GPL')
url="http://tycus.deviantart.com/art/NeoAlien-dark-42249685"
depends=()
source=(http://gnome-look.org/CONTENT/content-files/126879-NeoAlien-dark.tar.gz)

package() {
	cd $startdir/src
	install -d -m755 $startdir/pkg/usr/share/icons
	cp -R NeoAlien-dark $startdir/pkg/usr/share/icons
}
md5sums=('a14a152702af0c0a31528700b186ab35')
