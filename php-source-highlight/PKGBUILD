# Contributor: Patrick Brisbin <pbrisbin@gmail.com>
pkgname=php-source-highlight
pkgver=0.1
pkgrel=1
pkgdesc='PHP extension that uses the GNU source-hilight library for syntax highlighting'
arch=(i686 x86_64)
url='http://php-source-highlight.googlecode.com/'
license=('APACHE')
depends=('source-highlight>=3.0')
install=php-source-highlight.install
source=("$url/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('f1a36f84bde674cffbdd858ebdbf776a')

build() {
  cd "$srcdir/$pkgname"

  phpize
  ./configure --prefix=/usr --enable-sourcehighlight
  make || return 1
  make INSTALL_ROOT="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
