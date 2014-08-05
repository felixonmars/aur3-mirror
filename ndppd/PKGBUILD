pkgname=ndppd
pkgver=0.2.3
pkgrel=2
pkgdesc='A daemon that proxies NDP (Neighbor Discovery Protocol) messages between interfaces'
arch=('i686' 'x86_64' 'armv7h')
source=(
  "http://priv.nu/projects/ndppd/files/ndppd-${pkgver}.tar.gz"
  "ndppd.service"
)
md5sums=(
  'd6f3243bb7fc04c8085371c9acddc50e'
  '0fd135be2660b34a2dd0789e3ffd4a70'
)
backup=('etc/ndppd.conf')
depends=('gcc-libs')
license=('GPL3')
url='http://priv.nu/projects/ndppd/'

build(){
  cd "${srcdir}/ndppd-${pkgver}"
  make CXXFLAGS="${CXXFLAGS} -O3" all
}

package(){
  cd "${srcdir}/ndppd-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  mkdir -p "${pkgdir}/etc/"
  cp "ndppd.conf-dist" "${pkgdir}/etc/ndppd.conf"
  cd "${pkgdir}"/usr
  mv sbin bin
  
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp "${srcdir}/ndppd.service" "${pkgdir}/usr/lib/systemd/system/"
}