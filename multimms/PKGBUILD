# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=multimms
pkgver=1.0
pkgrel=4
pkgdesc="Search and listen or download music"
arch=(any)
license=('GPL3')
url="http://blog.desdelinux.net/gmultimms-gestor-de-descargas-mms"
depends=('python2' 'libmms')
source=('http://desdelinux.net/ftp/multimms_1.0-4_all.deb')
md5sums=('c81e9a811f79dd304ae69bb64fde4953')

package() {
  cd "${srcdir}"
  bsdtar -xf *.deb
  bsdtar -xf data.tar.gz

  # Python2 fix
  sed -i "s|\(bin/python\).*|\12|" `grep -rl bin/python .`

  cp -r usr $pkgdir
}
