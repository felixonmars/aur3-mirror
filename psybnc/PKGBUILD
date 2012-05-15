pkgname=psybnc
_pkgname=psyBNC
pkgver=2.3.2_9
# note: if the pkgver had been '0.99-10' then use an underscore, i.e. '0.99_10'
_pkgver=2.3.2-9
pkgrel=4
pkgdesc="psyBNC is an easy-to-use, multi-user, permanent IRC-Bouncer with many features."
arch=('i686' 'x86_64')
url="http://www.psybnc.at"
license=('GPL')
depends=('openssl')
makedepends=('ncurses')
backup=('usr/share/psybnc/psybnc.conf')
install=psybnc.install
source=(http://psybnc.at/download/beta/${_pkgname}-${_pkgver}.tar.gz
        compile.diff
        psybnc-2.3.2.9-multinetwork.patch
        psybnc-2.3.2.9-oidentd.patch
        psybnc-2.3.2.9-scripting.patch)
md5sums=('c2757cdf2cab668eb374a22abecc5572'
         '2124f394dd96767745c213070d934f54'
         '065671a27e298a64c89ee2b62aecf0da'
         '8666bbf5d677b3819bb930ed0ea63672'
         '12604c39d6b35a8065a0813fb79e8a1c')

build() {
  # Enter build directory
  cd "$srcdir/$pkgname"

  patch -p0 -i "$srcdir/compile.diff"
  patch -p0 -i "$srcdir/psybnc-2.3.2.9-multinetwork.patch"
  patch -p0 -i "$srcdir/psybnc-2.3.2.9-oidentd.patch"
  patch -p0 -i "$srcdir/psybnc-2.3.2.9-scripting.patch"

  # Prevent stripping the binary
  sed -i -e "/@strip/ d" "$srcdir/$pkgname/tools/autoconf.c"

  # Pretend we already have a certificate, we generate it in pkg_config
  mkdir -p "$srcdir/$pkgname/key"
  touch "$srcdir/$pkgname/key/psybnc.cert.pem"

  make clean
  make
}

package() {
  cd "$srcdir/$pkgname"

  # Create package tree and extract distributable binary
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/$pkgname" "$pkgdir/usr/share"
}
