# Maintainer: vn158 <vn158 at seznam dot cz>
pkgname=siano-dvbt-firmware
pkgver=1
pkgrel=2
pkgdesc="Siano chipset based DVB tuner firmware, e.g. Evolve Mars, media-tech MT4163"
arch=('any')
url="http://www.siano-ms.com"
license=('custom:oem')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
#install=
#changelog=

source=(http://blogiksa.myftp.org/_data/files/evolve/dvb_nova_12mhz_b0.inp)
noextract=(dvb_nova_12mhz_b0.inp)
md5sums=('1d0cd07524adfedca5913a00a708afda')

build() {
  :
}

package() {
  cd "$startdir"
  install -d -m755 pkg/lib/firmware
  install -m644 dvb_nova_12mhz_b0.inp pkg/lib/firmware
}
