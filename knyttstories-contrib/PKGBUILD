# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=knyttstories-contrib
pkgver=1.0.2
pkgrel=1
pkgdesc="This pack contains the official expansion pack as well as a number of additional third-party levels of good quality for Knytt Stories."
url="http://nifflas.ni2.se/"
arch=('i686' 'x86_64')
makedepends=('unzip')
depends=('knyttstories')
source=(http://178.63.102.135/svens_stuff/AStrangeDream_102.zip
        http://178.63.102.135/svens_stuff/ThirdPartyPack1_102.zip)
license=('freeware')
md5sums=('d58a3994db562f29ec9275be80e17cf7' 
         'b9f94fdd7516c32314778c57b8b66ea3')

build() {
	install -d -m775 -o root -g games $pkgdir/var/games/knyttstories/Worlds
	rm $srcdir/AStrangeDream_102.zip $srcdir/ThirdPartyPack1_102.zip
	mv $srcdir/* $pkgdir/var/games/knyttstories/Worlds/
	find $pkgdir/var/games/knyttstories/Worlds -type d -exec chmod 775 "{}" \;
	find $pkgdir/var/games/knyttstories/Worlds -type f -exec chmod 644 "{}" \;
	find $pkgdir/var/games/knyttstories/Worlds -type d -exec chown root:games "{}" \;
	find $pkgdir/var/games/knyttstories/Worlds -type f -exec chown root:games "{}" \;
}
