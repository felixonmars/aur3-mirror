# Contributor: Imanol Celaya <ilcra1989@gmail.com>

pkgname=pymusicpd
pkgver=0.1.3
pkgrel=3
pkgdesc="python mpd qt4 player"
license="MIT"
arch=('any')
url="http://sourceforge.net/projects/pymusicpd/"
depends=('python2-mpd' 'python2-qt4' 'confy')
source=(http://kent.dl.sourceforge.net/sourceforge/pymusicpd/$pkgname-$pkgver.tar.gz)
md5sums=('d70200e93d7ed47456c3b954dc5927a4')


package() {
	cd $srcdir/$pkgname/
	python2 setup.py install --root=$pkgdir --prefix=/usr
	install -Dm755 pymusicpd.py $pkgdir/usr/bin/pymusicpd
}
