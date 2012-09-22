# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=acorta
pkgver=1.1
pkgrel=1
pkgdesc="URL's shortener. Simply paste the url on the program and press ctrl+v to paste in any place"
arch=(any)
license=('GPL3')
url="http://blog.desdelinux.net"
depends=('bash'  'xclip'  'libnotify'  'curl')
source=('http://ftp.desdelinux.net/acorta_1.1.tar.gz')
md5sums=('ff573a84e5680dc014d883c9cfcbf9e7')

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/acorta
  install -m 755 acorta.sh  $pkgdir/usr/bin/${pkgname}
  sed -i "s/\/opt\/desdelinux/\/usr\/share/g" $pkgdir/usr/bin/${pkgname}
  cp *.png $pkgdir/usr/share/acorta
}
