# Maintainer: Arttu Liimola <arttu.liimola at gmail dot com>
pkgname=irggu-server-git
pkgver=20150323
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Client-server model application for chatting on IRC"
url="http://irggu.arggu.ath.cx/server/"
license=('GPL3')
depends=('qt5-base')
makedepends=('extra-cmake-modules')
source=("${pkgname}::git+https://gitlab.com/irggu-server/irggu-server.git"
        'irggu-server.tmpfiles'
        'irggu-server.service'
        'irggu-server.logrotate')
sha256sums=(SKIP
            'f43b71f557d3b0f8d304ee558611163d9ac2ea334049e61dcdd91c3f5828bfd1'
            '50ed2a7a384e9c62e7459afedd3c1a7f577b86da978d920875f6c7462961e304'
            '6f41d514ec3ce4683addadf52f00de56d0bec602045603f3019aa154887d5347')
install=irggu-server.install

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPID_FILE=/run/irggu/irggu.pid \
    -DSOCK_FILE=/run/irggu/irggu.sock \
    -DLOG_FILE=/run/irggu/irggu.log \
    -DCONF_FILE=/etc/irggu/irggu.conf
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  
  install -Dm644 "${srcdir}/irggu-server.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/irggu-server.conf"
  install -Dm644 "${srcdir}/irggu-server.service" "${pkgdir}/usr/lib/systemd/system/irggu-server.service"
  install -Dm644 "${srcdir}/irggu-server.logrotate" "${pkgdir}/etc/logrotate.d/irggu-server"
  install -Dm644 "${srcdir}/${pkgname}/irggu.conf" "${pkgdir}/etc/irggu/irggu.conf"

}
