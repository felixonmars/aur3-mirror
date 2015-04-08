# Contributor: Army

_pkgname=9base
pkgname=$_pkgname-git
pkgver=20140307.106
pkgrel=1
pkgdesc="A port of various original Plan 9 tools for Unix, based on plan9port."
arch=('i686' 'x86_64')
url="http://tools.suckless.org/9base"
license=('custom')
depends=(sh)
makedepends=('git')
provides=("$_pkgname" "$_pkgname-git")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$_pkgname::git+http://git.suckless.org/$_pkgname" 9 plan9.sh)
md5sums=('SKIP'
         'ae7108b9f26bed388e9055f35eef2986'
         '0fa02cbcca0bc4584d7378f13ec1a1de')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  case $CARCH in
    i686) sed -i 's#^OBJTYPE\s.*$#OBJTYPE = 386#' config.mk ;;
    x86_64) sed -i 's#^OBJTYPE\s.*$#OBJTYPE = x86_64#' config.mk ;;
  esac

  sed -i 's#^PREFIX\s.*$#PREFIX = /opt/plan9#' config.mk
  sed -i 's#^CFLAGS\s*+=#CFLAGS += -DPLAN9PORT #' config.mk

  # Force dynamic linking.  Several of the programs in 9base won't work
  # when statically linked against the latest glibc.
  sed -i '/-static/d' config.mk

}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
  install -m755 ../9 "$pkgdir/opt/plan9/bin/"
  install -D -m755 ../plan9.sh "$pkgdir/etc/profile.d/plan9.sh"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/9base/LICENSE"
}
