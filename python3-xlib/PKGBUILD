# Maintainer: maandree
# Maintainer: shmilee <shmilee.zju@gmail.com>

pkgname=python3-xlib
pkgver=0.15
_commit=4060f1ae2478389fa41f5d066485533d68e173f9
pkgrel=1
pkgdesc='Python 3 port of Xlib'
arch=(any)
url='https://github.com/LiuLang/python3-xlib'
license=('GPL2')
depends=('python')
makedepends=('python')
conflicts=('python-xlib')
install=python3-xlib.install
source=("${url}/archive/${_commit}.tar.gz")
sha256sums=('fe3572cc222a7061eec664a5da6c0351243436a98889ef8d974bb6ced136d1ac')


build() {
  cd "${srcdir}/${pkgname}-${_commit}/doc"
  make info
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"
  install -Dm644 doc/info/python-xlib.info "${pkgdir}/usr/share/info/python-xlib.info"
  install -dm755 "${pkgdir}/usr/share/python-xlib"
  cp -a examples "${pkgdir}/usr/share/python-xlib/examples"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
