# Maintainer: Thomas Gubler <thomasgubler@gmail.com>
_projectname=radiopy
pkgname=python2-$_projectname
pkgver=0.6
pkgrel=1
pkgdesc="A python wrapper for mplayer, designed to provide an easy-to-use interface for listening to radio from the command line."
arch=(any)
url="http://www.guyrutenberg.com/radiopy/"
license=('GPLv2')
depends=('python2' 'mplayer' 'python2-beautifulsoup4')
makedepends=('python2' 'python-setuptools')
optdepends=()
provides=($pkgname)
conflicts=($pkgname 'radio.py')
options=(!emptydirs)
md5sums=('dc6509705f105702a12b3652d32a5290')
source=("http://downloads.sourceforge.net/project/radiopy/radiopy/radio.py-$pkgver/$_projectname-$pkgver.tar.gz")

prepare() {
  cd "$srcdir/$_projectname-$pkgver"
  # patch to make tunein.com stations work, the issue is reported upstream
  sed -i -e 's/station\["playlist"\] = "yes"/station\["playlist"\] = "no"/' radiopy/stations_tunein.py
}

build() {
  cd "$srcdir/$_projectname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_projectname-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1
  install -Dm644 "$srcdir/$_projectname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
