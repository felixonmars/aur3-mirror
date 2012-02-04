# Contributor: berkus [berkus_at_madfire_dot_net]
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gmodplay
pkgver=0.08
pkgrel=2
pkgdesc="ModPlug-based command line module player"
arch=('i686' 'x86_64')
url="http://rani.free.fr/"
depends=('slang' 'glib')
license="GPL"
source=(http://rani.free.fr/${pkgname}-0.08.tar.gz gcc-compile.patch slang2.patch)
md5sums=('7cc04a1b470b7877a953cb8a1ee584a3'	'6d0c356974a610e7aab008c65518e921' 'd818783bff69839edd0e70edc75b235a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p0 -i ${srcdir}/gcc-compile.patch
  patch -p0 -i ${srcdir}/slang2.patch
  make 
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
