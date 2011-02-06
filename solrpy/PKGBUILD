# Contributor: cvalente ()

pkgname=solrpy
pkgver=0.7
pkgrel=2
pkgdesc="python client for the solr search service"
arch=('any')
url="http://code.google.com/p/solrpy/"
license=('APACHE')
depends=('python')
source=(http://pypi.python.org/packages/source/s/solrpy/$pkgname-$pkgver.tar.gz)
md5sums=('04f26c4700d1231ea075176f505286cc')
sha1sums=('d4de24b103375d8a6bba38af8f087c1042edd960')
sha256sums=('b73a55f0aaf6b0830f82a2bfc509ccb45562593e495ef210214f3ffa4ba36b3a')
sha384sums=('5a7ea6675104bf78c2bd2c8f06302f88f250687261a15bdd26357f8dd96fd3ff96a1fc78fbab9f10d3e9e9ddfee0144a')
sha512sums=('9299fed48907b6db0bb69837809c98e4788251aafaa572969ce0955b6572d7468b22e693495252d7dd4e96a076c549102bc8a1aee26ab21e85561377e80d4ca9')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root="$pkgdir" || return 1
}
