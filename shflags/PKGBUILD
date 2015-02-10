#Maintainer max_meyer
pkgname=shflags
pkgver=1.0.3
pkgrel=2
pkgdesc="Shell Flags (shFlags) is a library written to greatly simplify the handling of command-line flags"
arch=(any)
url="http://code.google.com/p/shflags/"
license=('LGPL')
depends=(sh)
provides=(shflags)
optdepends=(bash zsh dash ksh)
options=(zipman)
source=(http://shflags.googlecode.com/files/$pkgname-$pkgver.tgz)
md5sums=('b4d7133696ec05b71b27d8df5e278f0f')

package() {
  src="$srcdir/$pkgname-$pkgver/src/"
  dst="$pkgdir/usr/share/lib/shflags"
  mkdir -p "$dst" 

  if [ -f "$src/shflags" ]; then
      cp "$src/shflags" "$dst/shflags.sh"
  else
      msg "Warning shflags not found"
      exit 1
  fi

}

# vim:set ts=2 sw=2 et:
