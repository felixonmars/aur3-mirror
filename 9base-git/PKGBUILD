# Maintainer: Army
pkgname=9base-git
pkgver=20130303
pkgrel=1
pkgdesc="a port of various original Plan 9 tools for Unix, based on plan9port."
arch=('i686' 'x86_64')
url="http://tools.suckless.org/9base"
license=('GPL')
depends=('bash')
makedepends=('git')
provides=('9base' '9base-hg')
conflicts=('9base')
source=(9 plan9.sh)
md5sums=('ae7108b9f26bed388e9055f35eef2986'
         '62a9e52043d9c32967fcae9018fffb56')

_gitroot=http://git.suckless.org/9base
_gitname=9base

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  case $CARCH in
	i686) sed -i 's#^OBJTYPE\s.*$#OBJTYPE = 386#' config.mk ;;
	x86_64) sed -i 's#^OBJTYPE\s.*$#OBJTYPE = x86_64#' config.mk ;;
	esac

  sed -i 's#^PREFIX\s.*$#PREFIX = /opt/plan9#' config.mk
  sed -i 's#^CFLAGS\s*+=#CFLAGS += -DPLAN9PORT #' config.mk

  # Force dynamic linking.  Several of the programs in 9base won't work
  # when statically linked against the latest glibc.
  sed -i '/-static/d' config.mk

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -m755 ../9 "$pkgdir/opt/plan9/bin/"
  install -D -m755 ../plan9.sh "$pkgdir/etc/profile.d/plan9.sh"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/9base/LICENSE"
}

# vim:set ts=2 sw=2 et:
