# Maintainer: Neer Sighted (neersighted) <neersighted@myopera.com>
# Contributor : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm-pacman41-git
pkgver=0.5.2.5.g2fbd5a3
pkgrel=3
pkgdesc='Python 3 bindings for libalpm (for Pacman 4.1) (development version)'
url='https://projects.archlinux.org/users/remy/pyalpm.git/?h=pacman-4.1'
license=('GPL3')
source=('git://projects.archlinux.org/users/remy/pyalpm.git#branch=pacman-4.1'
) # Add a newline because of an AUR bug.
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('git')
conflicts=('pyalpm')
provides=('pyalpm')

pkgver() {
  cd "${srcdir}/pyalpm"

  git describe --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "${srcdir}/pyalpm"

  # Build it!
  python setup.py build
}

package() {
  cd "${srcdir}/pyalpm"

  # Install the library.
  python setup.py install --root="${pkgdir}" --prefix=/usr
}

# vim: set ts=2 sw=2 et:
