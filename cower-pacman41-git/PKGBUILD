# Maintainer: Neer Sighted (neersighted) <neersighted@myopera.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=cower-pacman41-git
pkgver=8.1.g2a6f071
pkgrel=4
pkgdesc='Simple AUR agent with a pretentious name (for Pacman 4.1) (development version)'
url='http://github.com/falconindy/cower'
license=('MIT')
source=('git://github.com/falconindy/cower.git#branch=pacman41'
) # Add a newline because of an AUR bug.
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('curl' 'libarchive' 'pacman' 'yajl')
makedepends=('git' 'perl')
conflicts=('cower')
provides=('cower')

pkgver() {
  cd "${srcdir}/cower"

  git describe --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "${srcdir}/cower"

  # Build it!
  make
}

package() {
  cd "${srcdir}/cower"

  # Install the program.
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim: set ts=2 sw=2 et:
