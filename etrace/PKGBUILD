pkgname=etrace
pkgver=1.1
pkgrel=1
pkgdesc="etrace is a configurable static port network tracing tool, similar to traceroute, but supporting ICMP, TCP, UDP and other IP protocols"
arch=('i686' 'x86_64')
license=('custom')
url="https://www.bindshell.net/tools/etrace.html"
depends=('libdnet')
source=("https://www.bindshell.net/tools/etrace/${pkgname}.${pkgver}.tgz")

build() {
  cd "${srcdir}/$pkgname"
  ./configure --prefix=/usr
  make 
}  

package() {
  cd "${srcdir}/$pkgname"
  make prefix="${pkgdir}"/usr install
  
  install -D -m644 "${srcdir}/$pkgname"/LICENSE \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

md5sums=('8e47908a75299e467b126b6730f88454')
