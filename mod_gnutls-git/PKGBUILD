# Contributors: Andrej Podzimek <andrej@podzimek.org>

pkgname=mod_gnutls-git
_pkgname=mod_gnutls
pkgver=r296.c32240f
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Apache module for the GnuTLS library"
arch=('i686' 'x86_64')
url="http://modgnutls.sourceforge.net/"
license=('Apache')
depends=('apache>=2.0.42' 'gnutls>=2.12.6' 'apr_memcache>=0.7.0')
optdedepends=('monkeysphere' 'msva-perl-git')
install=$pkgname.install
source=('mod_gnutls::git+https://mod.gnutls.org/git/'"$_pkgname")

sha512sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  autoreconf -fiv
  ./configure --prefix=/usr --with-apxs=/usr/sbin/apxs
  make
}

package() {
  cd "$srcdir/$_pkgname"
  sed -ir 's/@${APXS_BIN} -i -n gnutls mod_gnutls.so/mkdir -p $(DESTDIR)$(AP_LIBEXECDIR)\n\t@${APXS_BIN} -i -S LIBEXECDIR=$(DESTDIR)$(AP_LIBEXECDIR) -n gnutls mod_gnutls.so/' src/Makefile
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
