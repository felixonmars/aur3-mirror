# Maintainer: mali <mali@irc>
# Contributor: mali <mali@irc>

pkgname=xcursor-alien-mind-2
pkgver=2
pkgrel=1
pkgdesc="Original theme By DuoPixart"
arch=('any')
url="http://gnome-look.org/content/show.php/AlienMind2?content=104325"
license=('GPL')
source=(http://gnome-look.org/CONTENT/content-files/104325-AlienMindII.tar.gz) 

package() {
	mkdir -p "${pkgdir}"/usr/share/icons/AlienMindII
	cp -R "${srcdir}"/AlienMindII/{cursors,index.theme} \
		"${pkgdir}"/usr/share/icons/AlienMindII
}
md5sums=('58a60825518c043878b33fb4dc1208ef')
