# Contributor: Imanol Celaya <ilcra1989@gmail.com>

pkgname=confy
pkgver=0.1.1
pkgrel=2
pkgdesc="simple config parser and basic strings manipulation"
license="MIT"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pymusicpd/"
depends=('python2')
source=(http://downloads.sourceforge.net/pymusicpd/$pkgname-$pkgver.tar.gz)
md5sums=('9f8425d83ff76136e4f6820fc84262d5')


package() {
	cd $srcdir/$pkgname
	python2 setup.py install --root=$pkgdir --prefix=/usr
}
