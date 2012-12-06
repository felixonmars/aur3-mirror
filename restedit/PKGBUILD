# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=restedit
pkgver=1.1.1
pkgrel=1
pkgdesc="RESTful External Editor client helper application"
arch=('any')
license=('ZPL')
url="http://www.hforge.org/restedit"
depends=('python' 'tk')
source=(http://download.hforge.org/$pkgname/1.1/$pkgname-$pkgver.tar.gz)
md5sums=('5245365c736d187e208825207e7117aa')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  filename=restedit.py
  destination="$pkgdir/usr/bin/$filename"
  install -D -m 0755 "$filename" "$destination"
}
