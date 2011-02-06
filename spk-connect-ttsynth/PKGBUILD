# Maintainer: Michael Whapples <mwhapples atsign aim dot com>
pkgname=spk-connect-ttsynth
pkgver=1.1
pkgrel=2
pkgdesc="Speakup connector for IBMtts"
arch=('i686')
license=('LGPL')
url="http://www.speakupmodified.org/ttsynth"
depends=('alsa-lib')
backup=('etc/conf.d/spk-connect')
source=("http://www.speakupmodified.org/ttsynth/$pkgname-$pkgver.tar.gz"
  "spk-connect" "spk-connect.conf.d")
md5sums=('f09415c1c3daccd4262b5f28cf5826c8'
         '81b89e0895736ab4e3fef89b636e7962'
         'a1fa5fc9fb459bcfc91367d77b3e10da')

build() {
  cd "${srcdir}"
  install -m755 -D spk-connect "${pkgdir}/etc/rc.d/spk-connect"
  install -m644 -D spk-connect.conf.d "${pkgdir}/etc/conf.d/spk-connect"
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make
  install -m755 -D spk-connect-ttsynth "$pkgdir/usr/bin/spk-connect-ttsynth"
}


# vim:set ts=2 sw=2 et:
