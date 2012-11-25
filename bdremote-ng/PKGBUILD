# Contributor: Your Name <youremail@domain.com>
pkgname=bdremote-ng
pkgver=0.5
pkgrel=2
pkgdesc="A daemon that takes input from a PS3 bluetooth remote and converts it into something that can be given to LIRC. "
arch=(i686 x86_64)
url="http://code.google.com/p/bdremote-ng/"
license=('GPLv2')
groups=()
depends=(cmake lirc bluez)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install="$pkgname.install"
changelog=ChangeLog
source=(
    http://$pkgname.googlecode.com/files/$pkgname-${pkgver}.tar.bz2
    README.pkgbuild
    $pkgname.rc
    $pkgname.service
    $pkgname.conf
    lirc.service
    Lircmap.xml
    remote.xml
)
md5sums=(
    '5eccd63c8960a93580fd9ff1196a1841'
    'af9ad03b62d770d4f51e9f21d3349300'
    'f3aff706a1aa73508aeeb47ce758728a'
    'cb7d94a276414133768e89169527231a'
    '3ac3dd3eb858013c5bc87c145417f282'
    '1238b6df7721b44f70411041f7212adf'
    'b1f17a2a551bc8d5f0f66f08666974b7'
    'bbece0acc260d4a4b99d5e3319aae7da'
)
noextract=()

build() {
  cd "$srcdir/$pkgname-${pkgver}/build"
  ./gen.sh || return 1
  cd linux
  make || return 1
}

package() {
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/build/linux/bdremoteng ${pkgdir}/usr/sbin/bdremoteng
  install -D -m755 ${srcdir}/$pkgname.rc ${pkgdir}/etc/rc.d/$pkgname
  install -D -m644 ${srcdir}/$pkgname.service ${pkgdir}/usr/lib/systemd/system/$pkgname.service
  install -D -m644 ${srcdir}/$pkgname.conf ${pkgdir}/etc/conf.d/$pkgname
  install -D -m644 ${srcdir}/README.pkgbuild ${pkgdir}/usr/share/doc/bdremote-ng/README.pkgbuild

  for file in lirc.service Lircmap.xml remote.xml; do
      install -D -m644 ${srcdir}/${file} ${pkgdir}/usr/share/$pkgname/${file}
  done
}
