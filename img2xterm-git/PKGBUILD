# Maintainer: flu

_pkgbase=img2xterm
pkgname=${_pkgbase}-git
pkgver=20140513.28
pkgrel=1
pkgdesc="Display images on 256-color terminal emulators"
arch=(i686 x86_64)
url="https://github.com/rossy2401/img2xterm"
license=('GPL')
depends=('imagemagick' 'ncurses')
optdepends=('gimp' 'cowsay')
makedepends=('git')
license=('custom')
source=(git+https://github.com/rossy2401/img2xterm.git)
sha512sums=(SKIP)

pkgver() {
  cd   "$srcdir"/"${_pkgbase}"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd "${srcdir}/${_pkgbase}"
  make
}

package() {
  cd "${srcdir}/${_pkgbase}"
  install -D -m 0755 img2xterm $pkgdir/usr/bin/img2xterm
  ln -fs /usr/bin/img2xterm $pkgdir/usr/bin/img2cow
  install -D -m 0644 man6/img2xterm.6.gz $pkgdir/usr/share/man/man6/img2xterm.6.gz
  ln -fs /usr/share/man/man6/img2xterm.6.gz $pkgdir/usr/share/man/man6/img2cow.6.gz
}
