# Maintainer: Junchun Guan <junchunx.guan@intel.com>

pkgname='gbp-tizen'
pkgver=0.6.15.20140828
pkgrel=1
pkgdesc="Tools from Debian to integrate the package build system with Git"
arch=(any)
url="https://honk.sigxcpu.org/piki/projects/git-buildpackage/"
license=('GPL2')
conflicts=('git-buildpackage')
provides=('git-buildpackage')
depends=('git'
         'man-db'
         'python2'
         'rpm-org')
makedepends=('python2-distribute')
source=(git+git://git.tizen.org/tools/git-buildpackage)
sha256sums=('SKIP')
_gitname=git-buildpackage

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed -r 's/-/./g;s|.*/||')
}

build() {
  cd "$srcdir/$_gitname"
  WITHOUT_NOSETESTS=1 \
      python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  WITHOUT_NOSETESTS=1 \
    python2 setup.py install \
    --root="$pkgdir" \
    --prefix=/usr \
    -O1
}

# vim:set ts=2 sw=2 et:
