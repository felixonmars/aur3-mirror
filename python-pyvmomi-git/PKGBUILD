# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="python-pyvmomi-git"
pkgver=5.5.0.2014.1.1.r26.g7986a82
pkgrel=1
pkgdesc="VMware vSphere API Python Bindings."
arch=("any")
url="https://github.com/vmware/pyvmomi"
license=("Apache")
depends=("python" "python-six")
makedepends=("python-setuptools")
conflicts=("python-pyvmomi")
provides=("python-pyvmomi")
options=("!emptydirs")
source=("git+https://github.com/vmware/pyvmomi.git")
sha1sums=("SKIP")


pkgver() {
  cd "$srcdir/pyvmomi"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/pyvmomi"
  python setup.py install --root="$pkgdir/" --optimize=1
}
