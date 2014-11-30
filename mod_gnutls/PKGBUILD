# Maintainer: Michael Rasmussen <michael@michaelsnet.us>
# Contributors: Matt Kemp <matt@mattikus.com>, David Zaragoza <david@zaragoza.com.ve>

pkgname=mod_gnutls
pkgver=0.6
pkgrel=1
pkgdesc="Apache module for the GnuTLS library"
arch=('i686' 'x86_64')
url="http://modgnutls.sourceforge.net/"
license=('Apache')
depends=('apache>=2.0.42' 'gnutls>=2.12.6')
optdepends=('aprmemcache>=0.7.0')
install=$pkgname.install
source=(http://mod.gnutls.org/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('f1498a0b2f1c27356882af91778ac1fd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./build_module.sh
  ./configure 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -ir 's/@${APXS_BIN} -i -n gnutls mod_gnutls.so/mkdir -p $(DESTDIR)$(AP_LIBEXECDIR)\n\t@${APXS_BIN} -i -S LIBEXECDIR=$(DESTDIR)$(AP_LIBEXECDIR) -n gnutls mod_gnutls.so/' src/Makefile
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
