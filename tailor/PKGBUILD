pkgname=tailor
pkgver=0.9.35
pkgrel=4
pkgdesc="A version control system converter (CVS, SVN, BZR, GIT, HG, MTN, Darcs, etc.)"
url="http://wiki.darcs.net/DarcsWiki/Tailor"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2')
source=(http://darcs.arstecnica.it/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('58a6bc1c1d922b0b1e4579c6440448d1')

build()
{
	cd $startdir/src/$pkgname-$pkgver
	#python2 setup.py test
	python2 setup.py install --root=$startdir/pkg
}
