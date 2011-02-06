# Contributor: Simon Brakhane <simon.brakhane@web.de>
pkgname=icqabandon
pkgver=0.1
pkgrel=1
pkgdesc="An icq auto answer bot."
arch=("any")
url="http://bitbucket.org/luminger/icqabandon"
license=("GPL")
depends=("twisted")
source=(http://bitbucket.org/luminger/icqabandon/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('95f5dd10e43989a109498e777b1defed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build || return 1
  python setup.py install --root="$pkgdir"  || return 1
}
