# Maintainer: kevku <kevku@msn.com>
# Contributor:Xiang Yixiang <lovelinux229-at-gmail-dot-com>
pkgname=libppswrapper
pkgver=0.0.18.2
pkgrel=2
pkgdesc="A libpps wrapper"
arch=("i686" "x86_64")
url="http://code.google.com/p/totem-pps/"
license=('GPL')
if [[ "$CARCH" == 'i686' ]]; then
depends=('libpps')
makedepends=('intltool')
else
depends=('libpps' 'lib32-glibc')
makedepends=('gcc-multilib' 'intltool')
fi
source=("http://totem-pps.googlecode.com/files/$pkgname-$pkgver.tar.gz")
conflicts=('libppswrapper-git')
md5sums=('0723ee5a52766c8daa7dfcb71c19db6e')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --libexecdir=/usr/lib/libppswrapper --disable-static
  make
}
package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}


