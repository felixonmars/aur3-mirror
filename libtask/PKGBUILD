# Maintainer: Vincent Schüßler <v.schuessler@gmail.com>
# Contributor: Scott Tincman <sctincman@gmail.com>
# Contributor: Peter A. Shevtsov <pshevtsov@severusweb.ru>

pkgname=libtask
pkgver=1.0
pkgrel=4
pkgdesc="a coroutine library for C and Unix"
arch=('i686' 'x86_64')
url="http://swtch.com/libtask"
license=('MIT')
source=(${url}.tar.gz)
md5sums=('1039e58dcabaff26bc517cea8718a5ed')

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m644 libtask.a "${pkgdir}/usr/lib/libtask.a"
    install -D -m644 task.h "${pkgdir}/usr/include/task.h"
    install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
