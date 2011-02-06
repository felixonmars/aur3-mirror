# Maintainer: Ramon Arriaga <ramon.arriaga@gmail.com>

pkgname=ttf-ubuntu-beta
_pkgname=ttf-ubuntu
pkgver=0.1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
url="http://gnome-look.org/content/show.php/Ambiance+3+?content=128841"
pkgdesc="Ubuntu Maverick new BETA fonts"
arch=('any')
license=('GPL')
install=$_pkgname.install
source=('http://dl.dropbox.com/u/5922731/ttf-ubuntu-0.1.tar.xz')
md5sums=('057bbc58a21e4acaefdba56eaf4f36a7')

build(){
  	
	mkdir -p $pkgdir/usr/share/fonts/TTF
 	cp $srcdir/$_pkgname-$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
}

