# Maintainer: Daniel YC Lin <dlin.tw at gmail>
# Contributor : Konstantin Plotnikov <kostyapl at gmail dot com>
pkgname=fossil
pkgver=1.28
_date_pkgver=20140127173344
# NOTE: update _date_pkgver from http://www.fossil-scm.org/download.html
pkgrel=2
pkgdesc="Simple, high-reliability, distributed software configuration management"
arch=('i686' 'x86_64' 'sh4')
license=('BSD')
url="http://www.fossil-scm.org"
depends=('openssl' 'zlib')
makedepends=('wget')
conflicts=('fossil-fossil')
provides=('fossil')
source=("fossil.socket" "fossil@.service" "fossil-xinetd" "bash.completion"
  "http://www.fossil-scm.org/download/fossil-src-${_date_pkgver}.tar.gz"
)
build() {
  cd $srcdir/fossil-src-${_date_pkgver}
  ./configure --prefix=/usr
  # headers and translate targets are problematic with parallel jobs
  make -j1 bld bld/headers
  make
}

package() {
  cd $srcdir/fossil-src-${_date_pkgver}
  mkdir -p ${pkgdir}/usr/bin/
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 COPYRIGHT-BSD2.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 $srcdir/fossil-xinetd $pkgdir/etc/xinetd.d/fossil
  install -Dm644 $srcdir/fossil.socket $pkgdir/usr/lib/systemd/system/fossil.socket
  install -Dm644 $srcdir/fossil@.service $pkgdir/usr/lib/systemd/system/fossil@.service
  install -Dm644 $srcdir/bash.completion $pkgdir/usr/share/bash-completion/completions/fossil
}
sha1sums=('f5bc7385f84a60401c2854b598bf332c4bc3c0e3'
          '302d50ae056f6ca6f651593645eb78555b4658bc'
          'a5a753e13fbc43dcd670542193a12736586d8977'
          'd49fe8b0a4b7bcb046394f722ee60fd688e39397'
          '9e547a27d2447f12df951e86670da12c7cfbd26a')
