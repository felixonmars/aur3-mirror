# Maintainer: Vladimir Chizhov <master@mirlord.com>

pkgname=mad
pkgver=0.4.1
pkgrel=1
pkgdesc="markdown manual page viewer"
url="https://github.com/visionmedia/mad"
arch=('any')
license=('custom')
depends=('bash' 'git' 'less')
noextract=("${_pkgver_us}")
source=("https://github.com/visionmedia/mad/tarball/${pkgver}")
md5sums=('97f23c528c7320d099f6397a819c7e29')

build() {
    cd $srcdir
    tar -x --strip-components 1 -zf "${pkgver}"
}

package() {
  make PREFIX="${pkgdir}/usr" install
}

