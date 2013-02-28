# Maintainer: Neer Sighted (neersighted) <neersighted@myopera.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=expac-pacman41-git
pkgver=1.7.gbd8e738
pkgrel=6
pkgdesc='Pacman database extraction utility (for Pacman 4.1) (development version)'
url='http://github.com/falconindy/expac'
license=('MIT')
source=('git://github.com/falconindy/expac.git#branch=pacman41'
) # Add a newline because of an AUR bug.
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('pacman')
makedepends=('git' 'perl')
conflicts=('expac')
provides=('expac')

pkgver() {
  cd "${srcdir}/expac"

  git describe --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "${srcdir}/expac"

  # Build it!
  make
}

package() {
  cd "${srcdir}/expac"

  # Install the program.
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim: set ts=2 sw=2 et:
