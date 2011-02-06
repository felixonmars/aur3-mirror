# Contributor: haoyang.yuan <latteye(at)gmail(dot)com>
# Contributor: Rainy <rainylau(at)gmail(dot)com>
pkgname=scim-python
pkgver=0.1.13rc1
pkgrel=1
pkgdesc="A python wrapper for SCIM"
arch=(i686 x86_64)
url="http://code.google.com/p/scim-python/"
license=('GNU Lesser General Public License')
makedepends=('gcc' 'pkgconfig' 'diffutils' 'make' 'scim' 'sqlite3' 'python-pysqlite' 'pygtk')
depends=('python' 'scim' 'sqlite3')
source=(http://scim-python.googlecode.com/files/$pkgname-$pkgver.tar.gz)
install=scim-python.install
md5sums=('d3b21df185b88a2100c2eee0007bc2cd')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --disable-english-writer --disable-xingma
	make || return 1
	make NO_INDEX=true prefix=$startdir/pkg/usr install
	rm $startdir/pkg/usr/lib/scim-1.0/1.4.0/IMEngine/python.so
	rm $startdir/pkg/usr/lib/scim-1.0/1.4.0/Helper/python.so
	rm $startdir/pkg/usr/lib/scim-1.0/1.4.0/SetupUI/python.so
	cp $startdir/pkg/usr/lib/python2.5/site-packages/scim-0.1/scim/_scim.so $startdir/pkg/usr/lib/scim-1.0/1.4.0/IMEngine/python.so
	}
