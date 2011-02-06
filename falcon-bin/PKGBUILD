# Contributor: David Lindsay <dav7@dav7.net>
pkgname=falcon-bin
pkgver=0.8.14.2
pkgrel=1
pkgdesc="An open source, simple, fast and powerful VM-based programming language/scripting engine. (Pre-compiled distribution)"
arch=(i686)
url="http://www.falconpl.org/"
license=('GPL' 'custom:FPLL')
depends=(gcc-libs glibc)
replaces=(falcon)
source=(http://www.falconpl.org/project_dl/_official_rel/falcon-$pkgver-bin.tgz)
md5sums=('737d85f1f1a41625863ad4e9e536b91f')

build() {
	cp -r $srcdir/usr/ $pkgdir/
}
