# Contributor: Lauri Jäntti <lauri.jantti@cs.joensuu.fi>
pkgname=python-dictclient
pkgver=1.0.1
pkgrel=1
pkgdesc="This is a new library for interacting with Dict servers which supports all common Dict server requests"
url="http://gopher.quux.org:70/devel/"
license="GPL"
arch=(x86_64 i686)
depends=('python')
source=(http://gopher.quux.org:70/devel/dictclient/dictclient_$pkgver.tar.gz)
md5sums=('0a677022c2ae311d8cbff8f67ce1ba21')

build() {
  cd ${startdir}/src/dictclient
  python setup.py install --root=$startdir/pkg
}
