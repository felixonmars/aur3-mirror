# Contributor: Anselmo L. S. Melo <anselmolsm@gmail.com>
# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com>

pkgname=sagu
pkgver=0.74.5
pkgrel=1
pkgdesc="Simple Amazon Glacier Uploader"
arch=('i686' 'x86_64')
url="http://simpleglacieruploader.brianmcmichael.com/"
license=('GPL')
makedepends=('')
depends=('java-runtime')
_rev=0745
source=(http://dbpub.brianmcmichael.com/u/508510/SAGU/SimpleGlacierUploaderV$_rev.jar sagu.desktop sagu)
md5sums+=('8fe78b1fb71f86b42f478d580670c9ed' 'c2157dd2b47109485b6df668ef2fbcdd' '7704bc2a707237a137a3c1477a96c486')

build() {
  install -d $pkgdir/{opt/$pkgname,usr/bin,usr/share/applications} || return 1
  install ${srcdir}/SimpleGlacierUploaderV$_rev.jar $pkgdir/opt/$pkgname/ || return 1
  install -m755 ${srcdir}/sagu $pkgdir/usr/bin/ || return 1
  install -Dm644 ${srcdir}/sagu.desktop ${pkgdir}/usr/share/applications/ || return 1
}
