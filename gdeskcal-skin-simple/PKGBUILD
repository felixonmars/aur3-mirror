# Contributor: b4283 <damispirit@gmail.com>

pkgname=gdeskcal-skin-simple
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple, large-texted gdeskcal skin."
arch=('i686' 'x86_64')
url="http://there.is.no.website"
license=('GPL')
depends=('gdeskcal')
install=skin.install
source=(bg.png
		home.png
		next.png
		prev.png
		skin.xml
		today.png)
md5sums=('1f53e21947d85621770c49de57e42137'
          'ce48d99a0f7776d5edd6d16e7f616814'
          '93a2ca261ef3a3d213f4e5c10169a171'
          'cef2c21027c24f0c8248f2105b034ed8'
          '29d04a9f0e99782f71c3172ee3d151eb'
          'fb5282a72498f09410526d5b53182cf8')

build() {
	_target=$pkgdir/usr/lib/gdeskcal/skins/simple
	mkdir -p $_target
	install -m 644 $srcdir/* $_target
}
