pkgdesc="The Easel Javascript library provides a full, hierarchical display list, a core interaction model, and helper classes to make working with the HTML5 Canvas element much easier."
url='https://github.com/CreateJS/EaselJS'

pkgname='easeljs'
pkgver='0.7.1'
arch=('i686' 'x86_64')
pkgrel=1
license=('MIT')
makedepends=('nodejs-grunt-cli')
depends=('nodejs')

_tag=release_v${pkgver}
_dir=easeljs
source=("${_dir}"::"git+https://github.com/CreateJS/EaselJS.git"#tag=${_tag})
md5sums=('SKIP')

package() {
  cd ${srcdir}/${_dir}

  mkdir -p $pkgdir/usr/share/eventemitter2

  for file in $(find . -name 'lib/*.js' -print); do
    install -m644 -D $file $pkgdir/usr/share/eventemitter2/
  done
}

build() {
  cd ${srcdir}/${_dir}/build

  # Install the Grunt tasks specific to this project
  npm install .

  # Build project
  grunt build
}

package() {
  cd ${srcdir}/${_dir}/lib

  mkdir -p $pkgdir/usr/share/${_dir}/

  for file in $(find . -name '*.js' -print); do
    install -m644 -D $file $pkgdir/usr/share/${_dir}/
  done
}
