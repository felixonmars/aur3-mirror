# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: hm_b <hb@uiae.de>
# Contributor: btartsa <btartsa@gmail.com>

pkgname=non-daw
pkgver=1.1.0
pkgrel=2
pkgdesc="A powerful, reliable and fast modular Digital Audio Workstation"
arch=(i686 x86_64)
url="http://non-daw.tuxfamily.org/"
license=('GPL')
depends=('fltk11' 'jack' 'liblo' 'libsigc++' 'liblrdf' 'libxpm'
         'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('raptor1' 'imake')
provides=('non-mixer' 'non-session-manager')
conflicts=('non-mixer' 'non-session-manager')
install="$pkgname.install"
source=("http://download.tuxfamily.org/non/$pkgname-and-mixer-v$pkgver.tar.bz2")
md5sums=('58d017641c125cd055e4476120a90345')

build() {
  cd "$srcdir/$pkgname-and-mixer-$pkgver"

  # use fltk 1.1.10 (fltk11)
  find . -name config-funcs -exec \
    sed -i "s/fltk-config/fltk-1.1-config/" {} \;
  find . \( -name configure -o -name Makefile \) -exec \
    sed -i "s/fluid/&-1.1/" {} \;

  # non interactive
  find . -name configure -exec \
    sed -i "s/^ask.*\"\( .*\) \(\/*[^/]*\).*/append\1=\2/" {} \;

  # missing FLTK_CFLAGS for session-manager
  sed -i "s/^CXXFLAGS :=.*/& \$(FLTK_CFLAGS)/" \
    session-manager/Makefile

  # fix binary install command
  sed -i "s/install src/install -Dm755 src/" \
    {mixer,session-manager,timeline}/Makefile

  # set DESTDIR in makefiles (and a lot of fixes)
  sed -e "/bin\/non-daw/s/\\$/&(DESTDIR)\$/" \
      -e "/mkdir/s/\\$/&(DESTDIR)\$/" \
      -i timeline/Makefile
  sed -i "s/\$(DOCUMENT/\$(DESTDIR)&/" \
    {session-manager,mixer,timeline}/doc/Makefile

  make
}

package() {
  cd "$srcdir/$pkgname-and-mixer-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
