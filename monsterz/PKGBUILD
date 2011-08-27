# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua

pkgname=monsterz
pkgver=0.7.1
pkgrel=4
pkgdesc="A puzzler with cute beasties"
arch=('i686' 'x86_64')
url="http://sam.zoy.org/monsterz"
license="WTFPL"
depends=('python2' 'python-pygame' )
makepedpends=('inkscape')
backup=(var/games/monsterz)
source=(http://sam.zoy.org/monsterz/$pkgname-$pkgver.tar.gz
		license.txt monsterz.desktop python2.patch
		monsterz-0.7.1-blit-crash.patch)

build() { 
	cd $srcdir/

	patch -p1 < monsterz-0.7.1-blit-crash.patch
	patch -p1 < python2.patch

	cd $pkgname-$pkgver

	make prefix=/usr
}

package() {
	mkdir -p $pkgdir/usr/share/licenses/$pkgname $pkgdir/var

	cd $srcdir

	install -m 644 license.txt $pkgdir/usr/share/licenses/$pkgname

	cd $pkgname-$pkgver

	make prefix=$pkgdir/usr gamesdir=$pkgdir/usr/bin scoredir=$pkgdir/var/games/ install

	chmod 664 $pkgdir/var/games/monsterz
	install -D -m 644 ../${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}

md5sums=('c2bdb68dcd636df1abd130ac86defd11'
         '31e60337bafc4e3446f643733a52e137'
         '570d0dd270feab4ad63b4d077e86e41c'
         '81aa2634d5a25636567a3b437da7cc1e'
         'ba56db61ca28cc1f68f7903414a41fc5')
sha256sums=('50828b8fa26d107bcc2bd134328f83c905b9f5e124846bdf239daf0eed34973d'
            'a924d9a6c8fd76639dabadd9d62bcb8af91a4f53943292cd502b13fee63b9b87'
            'f36bb3eded07e05a49dd02dd1fd81de7e622b0696d6cf55ef29630d51cc6e8e5'
            'eaa0e604d45b82de9b89855acd81dc43be77460ce1b4decf5969e4481461f5a5'
            'e184581f2e490d2bb7f31f6766ebea51c7b7dc75199ad74b59eb45566b612090')
