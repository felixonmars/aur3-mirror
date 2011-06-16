# Maintainer: piojo
pkgname=mod_xsendfile
pkgver=0.12
pkgrel=1
pkgdesc="An Apache2 module that processes X-SENDFILE headers and sends file contents."
arch=(x86_64 i686)
url="https://tn123.org/mod_xsendfile/"
license=('Apache-2')
depends=(apache libtool)
install=xsendfile-instructions.install
source=(${url}/$pkgname-$pkgver.tar.gz)
md5sums=('9db4769a9ad6244ee70c31cdcfd25ae0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  apxs -c mod_xsendfile.c
  install -d "${pkgdir}/usr/lib/httpd/modules"
  libtool --mode=install cp mod_xsendfile.la "${pkgdir}/usr/lib/httpd/modules"
  rm "${pkgdir}"/usr/lib/httpd/modules/mod_xsendfile.{a,la}
}

# vim:set ts=2 sw=2 et: