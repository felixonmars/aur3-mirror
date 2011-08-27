# Contributer: Wieland Hoffmann <the_mineo@web.de>
# Contributer: Amr Hassan <amr.hassan@gmail.com>

pkgname=pylast
pkgver=0.5.4
pkgrel=2
pkgdesc="A Python interface to the Last.fm API"
arch=('i686' 'x86_64')
url="http://pylast.googlecode.com"
license=('APACHE')
makedepends=('python')
depends=('python')
source=(http://pypi.python.org/packages/source/p/pylast/pylast-$pkgver.tar.gz)

build() {
  cd $startdir/src/pylast-$pkgver
  python setup.py install --root=$startdir/pkg --optimize=1
}

md5sums=('1cbb1d75815579b7abac37e9d9f65e19')

