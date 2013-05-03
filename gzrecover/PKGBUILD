# Contributor: CYB3R <dima@golovin.in>
# Maintainer: CYB3R <dima@golovin.in>
pkgname=gzrecover
pkgver=0.7
pkgrel=1
pkgdesc="A tool for recovering your corrupted gzip backups (also known as gzrt)"
arch=('i686' 'x86_64')
license=("GPL2")
depends=('cpio' 'zlib')
makedepends=()
url=("http://www.urbanophile.com/arenn/hacking/gzrt/gzrt.html")
source=("http://www.urbanophile.com/arenn/hacking/gzrt/gzrt-${pkgver}.tar.gz")
 
build() {
   cd ${srcdir}/gzrt-${pkgver}
   make || return 1
}

package() {
   install -Dm755 "${srcdir}/gzrt-${pkgver}/${pkgname}" "${pkgdir}/sbin/${pkgname}"
}

md5sums=('b627d300c8f20ae5fc406e24cbe5aba9')

