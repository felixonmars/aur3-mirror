# Maintainer: Your Name <youremail@domain.com>

pkgname=pospelcheck
pkgver=0.10
pkgrel=1
pkgdesc="Run aspell for PO files"
arch=(any)
url="https://github.com/holygeek/pospelchek"
license=('GPL')
depends=(perl-config-general perl-file-slurp perl-html-strip perl-io-prompt perl-locale-po perl-regexp-common perl-text-aspell aspell)
options=()
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        pospelcheck-COPYING)
md5sums=('48e32ea8727518a310ff68f563951200'
         '43709d250496aacda7f57aed95094228')

package() {
	install -Dm755 pospelchek-$pkgver/pospelchek "$pkgdir"/usr/bin/$pkgname
	install -Dm644 pospelcheck-COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
