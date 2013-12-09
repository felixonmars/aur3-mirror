# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname='git-buildpackage-rpm'
pkgver=0.6.0_git20120419_508_g1be5deb
pkgrel=1
pkgdesc="Tools from Debian to integrate the package build system with Git"
arch=(any)
url="https://honk.sigxcpu.org/piki/projects/git-buildpackage/"
license=('GPL')
conflicts=('git-buildpackage')
provides=('git-buildpackage')
depends=('git'
         'man-db'
         'python2'
         'rpm-org')
makedepends=('python2-distribute')
source=("$pkgname"::"git+https://github.com/marquiz/git-buildpackage-rpm.git")
sha256sums=(SKIP)

pkgver() {
  cd $srcdir/$pkgname
  git describe | sed -e 's;debian/\(.*\);\1;' -e 's/-/_/g'
}

build() {
  cd $srcdir/$pkgname
  WITHOUT_NOSETESTS=1 \
      python2 setup.py build
}

package() {
  cd $srcdir/$pkgname
  WITHOUT_NOSETESTS=1 \
    python2 setup.py install \
    --root="$pkgdir" \
    --prefix=/usr \
    -O1
}

# vim:set ts=2 sw=2 et:
