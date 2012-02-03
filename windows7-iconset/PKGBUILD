###############################################.......NOTE .......###################################################
##......... I DID NOT MAKE THIS ICON SET...##...I just made this package, so we can use it in archlinux. ..........##

#================================================== Credits: ======================================================#
##### The Microsoft Windows and Office Logos are a Copyright of Microsoft. Credit goes to the hard working    ####
## ## Win2-7 Development Team, its Contributors, Content Creators, Translators, Wiley.E Coyote, and M!CR0$0FT ## ##
#### I added the blue7 gtk3 theme  (I renamed it to Win2-7) ###
### blue 7 theme ### http://gnome-look.org/content/show.php/blue+7+theme?content=148167

# Maintainer: Ramon Arriaga <ramon.arriaga@gmail.com>
pkgname=windows7-iconset
pkgver=1.8.3
pkgrel=1
pkgdesc="Windows 7 (Backgrounds, gtk-themes, sounds & icons), dockbarx, emerald, emesene, gdm & plymouth themes"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php?content=113264&forumpage=6&PHPSESSID=6"
license=('GPL' 'Copyright')
groups=(unsupported gnome)
depends=('gtk-engine-murrine'  'nautilus')
optdepends=('victory-gtk-theme'  'emesene' 'plymouse')
conflicts=()
backup=()
install=
source=(http://dl.dropbox.com/u/5922731/${pkgname}-${pkgver}.tar.xz)
md5sums=('b848bf04814b68cde3b752c672623b1c') 

build() {
	
	install -d $pkgdir/usr/ 
	cd $srcdir/$pkgname-$pkgver/
	cp -r usr/* $pkgdir/usr/ 
        chmod -R 755 /$pkgdir/usr/* 
	
}
