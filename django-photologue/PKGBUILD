# Contributor: Martin Sandsmark <sandsmark@samfundet.no>

pkgname=django-photologue
pkgver=2.2
pkgrel=1
pkgdesc="Photologue is a reusable Django application that provides powerful image management and manipulation functionality as well as a complete photo gallery solution."
arch=(any)
url="http://code.google.com/p/$pkgname/"
license=('BSD')
depends=('python' 'django')
options=(!emptydirs)
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.zip)

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/
}
md5sums=('1647c828cf8caa3decd5c621270eadd3')
