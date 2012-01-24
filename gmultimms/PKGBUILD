# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=gmultimms
pkgver=1.0
pkgrel=1
pkgdesc="Frontend for multimms"
arch=(any)
license=('GPL')
url="http://blog.desdelinux.net/gmultimms-gestor-de-descargas-mms"
depends=('python2' 'multimms')
source=("http://desdelinux.net/ftp/${pkgname}_${pkgver}_all.deb")
md5sums=('db1268f8f5ec27e02a86421e3a9f5413')

package() {
  cd "${srcdir}"
  bsdtar -xf ${pkgname}_${pkgver}_all.deb
  bsdtar -xf data.tar.gz

  # Python2 fix
  sed -i "s|\(bin/python\).*|\12|" `grep -rl bin/python .`
  sed -i "s/python/python2/g" usr/bin/$pkgname

  cp -r usr $pkgdir
}
