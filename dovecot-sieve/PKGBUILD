# Contributor: Paul Ezvan <paul@ezvan.fr>
# Maintainer: Karolina Lindqvist <karolina.linqdvist@kramnet.se>
pkgname=dovecot-sieve
pkgver=0.3.0
pkgrel=2
_dovecotvers=2.1
pkgdesc="Dovecot sieve plugin"
arch=('i586' 'i686' 'x86_64')
url="http://wiki.dovecot.org/LDA/Sieve"
license=('LGPL')
depends=("dovecot>=$_dovecotvers")
source=(http://www.rename-it.nl/dovecot/$_dovecotvers/dovecot-$_dovecotvers-pigeonhole-$pkgver.tar.gz)
md5sums=('a3e19701b775bfe1d8059c1dffd43f80')

build() {
  
  cd "$srcdir/dovecot-$_dovecotvers-pigeonhole-$pkgver"

  # the LDFLAGS="" hack fixes a build problem.
  LDFLAGS="" ./configure --prefix=/usr
  # Fix the runtime problem of not finding libraries
  # This only works as long as the Makefiles are not regenerated, which
  # should not happen in this build script.
  sed 's|managesieve_login_LDADD = |managesieve_login_LDADD = -rpath /usr/lib/dovecot |' -i.orig src/managesieve-login/Makefile
  sed 's|managesieve_LDADD = |managesieve_LDADD = -rpath /usr/lib/dovecot |' -i.orig src/managesieve/Makefile
  make
  make DESTDIR="$pkgdir" install
}
