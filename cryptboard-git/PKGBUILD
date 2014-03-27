# Maintainer: Thomas Dwyer <devel@tomd.tel>

pkgname=cryptboard-git
pkgver=v1.1.r3.ge540aa0
pkgrel=1
pkgdesc="An encrypted X11 clipboard manager"
arch=('any')
url="https://github.com/tdwyer/cryptboard"
license=('GPL')
depends=('gnupg' 'xclip' 'xdotool' 'pish-git')
makedepends=('git')
conflicts=('cryptboard')
provides=('cryptboard')
source=("$pkgname"::'git://github.com/tdwyer/cryptboard.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  sed -i 's/^XCLIP_EXE=.*/XCLIP_EXE="\/usr\/bin\/xclip"/' cryptboard
  sed -i 's/^XDO=.*/XDO="\/usr\/bin\/xdotool"/' cryptboard
  sed -i 's/^GPG=.*/GPG="\/usr\/bin\/gpg2"/' cryptboard
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/cryptboard"
  install -T -m 0755 cryptboard "$pkgdir/usr/bin/cryptboard"
  install -T -m 0644 cryptboard.conf "$pkgdir/usr/share/cryptboard/cryptboard.conf"
  cp -a {cb-i,cb-o,cb-c,cb-p,cb-d} "$pkgdir/usr/bin/"
}

# vim: ft=sh syn=sh et
