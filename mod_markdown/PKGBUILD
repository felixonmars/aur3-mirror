# Maintainer: Josh Kropf <josh@slashdev.ca>

pkgname=mod_markdown
pkgver=1.0.1
pkgrel=2
pkgdesc="Markdown filter module for Apache HTTPD Server"
license=('APACHE')
arch=('i686' 'x86_64')
url="https://github.com/hamano/apache-mod-markdown"
depends=('apache' 'discount')
source=("https://github.com/downloads/jiggak/apache-mod-markdown/mod_markdown-1.0.1.tar.gz")
sha256sums=('89f858125c29365c6edbeb5d53658d4f5b468be5b7f4762b3c568cf4bfdd6b9c')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make top_dir=/usr/lib/httpd
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make top_dir=/usr/lib/httpd DESTDIR="$pkgdir" install
}