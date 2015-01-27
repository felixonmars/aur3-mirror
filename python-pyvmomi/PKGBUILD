# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="python-pyvmomi"
pkgver="5.5.0.2014.1.1"
pkgrel="3"
pkgdesc="VMware vSphere API Python Bindings."
arch=("any")
url="https://github.com/vmware/pyvmomi"
license=("Apache")
depends=("python" "python-six")
makedepends=("python-setuptools")
conflicts=("python-pyvmomi-git")
options=("!emptydirs")
source=("https://github.com/vmware/pyvmomi/releases/download/v5.5.0.2014.1.1/pyvmomi-5.5.0.2014.1.1.tar.gz")
sha1sums=("dd7015d459d1c82c7b592afd9ba70bb2418f0f83")


package() {
  cd "$srcdir/pyvmomi-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
