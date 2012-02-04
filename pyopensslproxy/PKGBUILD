# Contributor: Your Name <youremail@domain.com>
pkgname=pyopensslproxy
pkgver=0.1
pkgrel=1
pkgdesc="Provides HTTPS proxy support to httplib and urllib2 classes."
arch=('i686' 'x86_64')
url=(http://richard.jones.name/google-hacks/gmail-filesystem/gmail-filesystem.html)
license=('GPL-2')
groups=()
depends=('pyopenssl>=0.6')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://richard.jones.name/google-hacks/gmail-filesystem/pyOpenSSLProxy-0.1.tar.gz)
noextract=()
md5sums=('d5df6afaa0a6c76199422e072abb667d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

	python setup.py build
	python setup.py install --prefix=$startdir/pkg/usr
}

# vim:set ts=2:
