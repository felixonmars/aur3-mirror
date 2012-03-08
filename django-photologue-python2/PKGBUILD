# Maintainer: Dávid Gábor BODOR <daivd.gabor.bodor@gmail.com>
# Contributor: Martin Sandsmark <sandsmark@samfundet.no>

pkgname=django-photologue-python2
pkgver=2.2
pkgrel=1
pkgdesc="Photologue is a reusable Django application that provides powerful image management and manipulation functionality as well as a complete photo gallery solution. (Python 2 version.)"
arch=(any)
url="http://code.google.com/p/django-photologue/"
license=('BSD')
depends=('python2' 'django')
options=(!emptydirs)
source=(http://django-photologue.googlecode.com/files/django-photologue-$pkgver.zip)
md5sums=('1647c828cf8caa3decd5c621270eadd3')

build() {
  cd $srcdir/django-photologue-$pkgver
  python2 setup.py install --root=$pkgdir/
}
