# Maintainer: Thomas NJ Shadwell <thomas.shadwell @t google maildot com>
pkgname=jvjsdoc
pkgver=0.5
pkgrel=2
pkgdesc="The JvJsDoc documentation generator for Closure annotated Javascript."
arch=('any' 'i686' 'x86_64')
url="http://www.seehuhn.de/pages/jvjsdoc"
license=('CCPL')
depends=('python' 'closure-library')
source=(http://m.seehuhn.de/programs/$pkgname-$pkgver.tar.gz)
md5sums=('c2c837150df941fe17b4466516802724')

build() {
  cd $pkgname-$pkgver

  ./configure \
	  --prefix=/usr \
	  --with-closure-library=/opt/closure-library \
	  PYTHON="$(which python)"
  make
}

package() {
  cd $pkgname-$pkgver
  sed -i 's/\/usr\/local/\/usr\//g' config.py

  make DESTDIR="$pkgdir/" install
}
