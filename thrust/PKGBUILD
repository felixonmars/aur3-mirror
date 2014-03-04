# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=thrust
pkgver=1.7.0
pkgrel=1
pkgdesc="A C++ library of parallel algorithms similar to the STL"
arch=('any')
url="http://thrust.github.com/"
license=('Apache')
optdepends=('cuda' 'cuda3' 'intel-tbb')
source=("http://github.com/thrust/thrust/releases/v1.7.0/614/thrust-1.7.0.zip")
md5sums=('38b117bbb295a3e87a3b1d37deea0a62')

package() {
  mkdir -p "$pkgdir/usr/include"
  cp -r "$srcdir/thrust" "$pkgdir/usr/include/"

  mkdir -p "$pkgdir/etc/profile.d"
  echo "export THRUST_PATH=/usr/include" > "$pkgdir/etc/profile.d/thrust.sh"
  chmod a+x "$pkgdir/etc/profile.d/thrust.sh"
}
