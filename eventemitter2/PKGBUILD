pkgdesc="A nodejs event emitter implementation with namespaces, wildcards, TTL, works in the browser."
url='https://github.com/asyncly/EventEmitter2'

pkgname='eventemitter2'
pkgver='0.4.13'
arch=('i686' 'x86_64')
pkgrel=1
license=('MIT')
makedepends=()
depends=('nodejs')

_tag=${pkgver}
_dir=eventemitter2
source=("${_dir}"::"git+https://github.com/asyncly/EventEmitter2.git"#tag=${_tag})
md5sums=('SKIP')

package() {
  cd ${srcdir}/${_dir}

  mkdir -p $pkgdir/usr/share/eventemitter2

  for file in $(find . -name 'lib/*.js' -print); do
    install -m644 -D $file $pkgdir/usr/share/eventemitter2/
  done
}
