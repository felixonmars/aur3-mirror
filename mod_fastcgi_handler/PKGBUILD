# Maintainer: dmi <aur@dmi.me.uk>
pkgname=mod_fastcgi_handler
pkgver=0.6
pkgrel=3
pkgdesc="A simple FastCGI handler for Apache 2"
arch=(x86_64 i686)
url="https://github.com/b826t/mod_fastcgi_handler/"
license=('BSD')
depends=(apache)
makedepends=(libtool)
install=fastcgi_handler.install
source=("https://github.com/b826t/mod_fastcgi_handler/tarball/275faea6adbfc44296261f298d4b6ef5dd947ae5")
md5sums=('fb2ab65b51ee91964e17c94f1539d45a')

build() {
  cd "$srcdir/"*"${pkgname}"*

  apxs -c -o mod_fastcgi_handler.so -c *.c
  install -d "${pkgdir}/usr/lib/httpd/modules"
  libtool --mode=install cp mod_fastcgi_handler.la "${pkgdir}/usr/lib/httpd/modules"
  rm "${pkgdir}"/usr/lib/httpd/modules/mod_fastcgi_handler.{a,la}

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
