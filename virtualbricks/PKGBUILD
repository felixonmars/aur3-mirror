# Maintainer: JWBirdsong  < @ gmail.com>
# Contributor: max_meyer
# Contributor: altkrall
pkgname=virtualbricks
pkgver=0.6
pkgminorver=352
pkgrel=1
pkgdesc="An all in one virtualization solution available for the linux desktop"
arch=(any)
url="http://virtualbricks.eu/"
license=('GPL')
depends=('gnome-python-extras' 'python2' 'libglade' 'python-pygraphviz' 'python2-imaging')
provides=(virtualbricks)
conflicts=(virtualbricks-bzr)
options=('!libtool' '!emptydirs')
source=(https://launchpad.net/virtualbrick/trunk/0.5/+download/virtualbricks-$pkgver.$pkgminorver.tar.bz2 python2-micro.patch patch-virtualbricks-bin.patch)

sha512sums=('b26eff9392103fd501b441d8a783710507c58799cc979cb79692d6b6369a7ab4d8b95fa49fdc73a6cfc4531cc1b1525ca31cbc77ce648f74f08012175b667b34'
            'f57de2719feb458b62d356566e9c8576db50979d284621023f4db2648a72160e562443c6d290dd8beaf17cb2ca2d2c9d40613fbb47ef7dbe5ca710fa486b1b67'
            '1e9c974c6dba08e4c13b73f9c3b75b56877764f4499b1fa323132b65116e6fedfb8d0984969564d6de4fd8fd9a37c4620fc73db0f6d14f3fcada9af932fc14cd')

PYTHON="/usr/bin/python2"

build() {
  cd "$srcdir/$pkgname"
  sed -i "s|/usr/local|/usr|" setup.py
  patch "setup.py" "$startdir/python2-micro.patch"
  $PYTHON setup.py build -b $pkgdir
  sed -e "s/___VERSION___/$pkgver/g" < ./share/virtualbricks.template.glade > share/virtualbricks.glade
  patch "./main/virtualbricks" "$startdir/patch-virtualbricks-bin.patch"
}

package() {
  cd "$srcdir/$pkgname"
  $PYTHON setup.py install --prefix=/usr/ --root=$pkgdir/ --optimize=1
} 

