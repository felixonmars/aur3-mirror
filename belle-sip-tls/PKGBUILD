# $Id: PKGBUILD 99895 2013-10-31 02:20:19Z allan $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=belle-sip-tls
_pkgname=belle-sip
pkgver=1.3.0
pkgrel=1
pkgdesc="A Voice-over-IP phone with TLS support"
arch=('i686' 'x86_64')
url="http://www.linphone.org/index.php/eng"
license=('GPL')
depends=('libantlr3c' 'gcc-libs' 'polarssl')
makedepends=('java-runtime')
provides=('belle-sip')
conflicts=('belle-sip')
options=('!emptydirs')
source=("http://download-mirror.savannah.gnu.org/releases/linphone/belle-sip/belle-sip-$pkgver.tar.gz"
	"antlr.jar::https://github.com/antlr/website-antlr3/blob/gh-pages/download/antlr-3.4-complete.jar?raw=true")
noextract=('antlr.jar')
md5sums=('ae9e8be12f62552a5376edd66b0265d9'
         '1b91dea1c7d480b3223f7c8a9aa0e172')

prepare() {
  cd $_pkgname-$pkgver
  sed -i "s#antlr_java_prefixes=.*#antlr_java_prefixes=$srcdir#" configure{,.ac}
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --disable-tests --disable-static --enable-tls --libexecdir=/usr/lib/$_pkgname
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
