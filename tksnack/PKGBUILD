# Maintainer: M4rQu1Nh0S <zonadomarquinhos@gmail.com>

pkgname=tksnack
_pkgname=snack2
pkgver=2.10
pkgrel=1
pkgdesc="the Python interface to Snack"
arch=('any')
url="http://www.speech.kth.se/snack/"
license=('GPL2')
depends=('python2' 'snack')
options=(!emptydirs)
source=("http://www.speech.kth.se/snack/dist/$_pkgname.$pkgver.tar.gz")
md5sums=('98da0dc73599b3a039cba1b7ff169399')

package() {
  cd "$srcdir/$_pkgname.$pkgver/python"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
