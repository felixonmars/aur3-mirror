pkgname=tworld2-levels-cclp
pkgver=2
pkgrel=2
pkgdesc="Official community levels for Chips Challenge"
url="http://www.pillowpc2001.net/"
arch=(any)
depends=(tworld2)
license=(GPL)
source=(http://www.pillowpc2001.net/CCLP1.zip
        http://www.pillowpc2001.net/CCLP2.zip
        http://www.pillowpc2001.net/CCLP3.zip)
md5sums=('874e4e2cc0d5c9b854c4b21883d79786'
         '32e1993654510affab659e5b90ab7ded'
         'c9721504a5cc497ac99f4f5742ffa6d1')
sha1sums=('539c3cee15a4d0bf794fd44eb5e146d3a07fb812'
          'f0ae149adb09a4df81b94acb3d775ef4db42c50b'
          '0a3782f2bc2c4d978d7fc4c05bf83ceb23a239a0')

package() {
	cd $srcdir/

	mkdir -p "$pkgdir"/usr/share/tworld/sets
	install -Dm644 CCLP2.dat "$pkgdir/usr/share/tworld/data/CCLP2.dat"
	install -m644 data/* "$pkgdir/usr/share/tworld/data"
	install -m644 sets/* "$pkgdir/usr/share/tworld/sets"
}
