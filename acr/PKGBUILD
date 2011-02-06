# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname=acr
pkgver=0.7.2
pkgrel=1
pkgdesc="ACR is an autoconf like tool that allows you to create configure scripts for your programs."
arch=('any')
url="http://nopcode.org/wk.php/Acr"
license=('GPL2')
depends=()
source=("http://www.lolcathost.org/b/$pkgname-$pkgver.tar.gz" destdir.patch)

md5sums=('dcd352df1c5129edbbc242197232edab'
         'fea258267a617fa7b6c0a425a4d1aa06')
sha512sums=('98e45f3a1b18757edd3a4499e7f18f5e56edba4956c74dc80b03db4d76d34774beb60ab0037c95a86a62ea29a7a2b8c9418f8368b0438efdb4297185264dc615'
            '4ebe4bfb14647d6dd7479a5d648e3062c7a16b805d62ce48ae6729e1229a30b3b7cb63aa4a2e717fe3685cb815c05b30f37daab91d52b7501c48e023fa9290e4')

build() {
  cd "${srcdir}/$pkgname-${pkgver}"
  patch -p1 <../destdir.patch
  ./configure --prefix=/usr --mandir=/usr/share/man
}

package() {
  cd "${srcdir}/$pkgname-${pkgver}"
  make DESTDIR=${pkgdir} install
}
