pkgdesc="JavaScript 3D library."
url='http://threejs.org/'

pkgname='threejs'
pkgver='66'
arch=('i686' 'x86_64')
pkgrel=1
license=('MIT')
makedepends=('python2')
depends=()

_tag=r${pkgver}
_dir=threejs
source=("${_dir}"::"git+https://github.com/mrdoob/three.js.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  cd ${srcdir}/${_dir}/utils/build

  # Build project
  python2 build.py --include common
}

package() {
  cd ${srcdir}/${_dir}/build

  mkdir -p $pkgdir/usr/share/${_dir}/

  for file in $(find . -name '*.js' -print); do
    install -m644 -D $file $pkgdir/usr/share/${_dir}/
  done
}
