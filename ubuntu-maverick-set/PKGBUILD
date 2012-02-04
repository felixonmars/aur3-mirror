########################## CREDITS #######################################
#Humanity is designed and developed by Daniel Foré <Daniel.p.Fore@gmail.com>, Jonian Guveli ##########
#<jonian.guveli@gmail.com>, and K.Vishnoo Charan Reddy<foo.mac.v@gmail.com>. #################


# Maintainer: Ramon Arriaga <ramon.arriaga@gmail.com>
pkgname=ubuntu-maverick-set
pkgver=0.1.8
pkgrel=1
pkgdesc="ubuntu maverick: backgrounds, comunity themes, & icons. I mixed them to make this package."
arch=('any')
url="https://launchpad.net/humanity"
license=('CCPL' 'GPL2' 'GPL')
depends=()
optdepends=('light-themes')
source=('http://dl.dropbox.com/u/5922731/ubuntu-maverick-set-0.1.8.tar.xz')
noextract=()
md5sums=('0370c679021cfcecb4415926b5c2f178')

build() {
	
	mkdir -p $pkgdir/usr/share/
	cd $srcdir/$pkgname-$pkgver/usr/share
        cp -R * $pkgdir/usr/share/
}


