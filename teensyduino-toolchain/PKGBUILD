# Maintainer: Niels Martignène <niels.martignene@gmail.com>
 
pkgname=teensyduino-toolchain
pkgver=1.19
_arduino=1.0.5
pkgrel=1
pkgdesc='Stock compiler toolchains for Teensyduino'
arch=('i686' 'x86_64')
url="http://www.pjrc.com/teensy/teensyduino.html"
options=(!strip staticlibs)
license=('GPL' 'LGPL')
depends=('teensyduino')
makedepends=('xorg-server-xvfb' 'libxft' 'xdotool')
conflicts=('arduino-toolchain')
source=("http://arduino.googlecode.com/files/arduino-${_arduino}-linux32.tgz"
        "http://www.pjrc.com/teensy/td_${pkgver//./}/teensyduino.32bit"
        'teensyduino.sh')
sha256sums=('9fa315c3f13b30900a45373b8c5876bb60b78c228271ed82d53e6ebe427e287f'
            '25646271795f08b2aeca9115c1c0b3c748d785ed57a72fb7a1d685da80c2dab7'
            'ae78c43671b84b7835a8b91d542f4bdaf6e448a4d26a479facb4fd924353bb1a')

if [ "$CARCH" == 'x86_64' ]; then
  source[0]="http://arduino.googlecode.com/files/arduino-${_arduino}-linux64.tgz"
  source[1]="http://www.pjrc.com/teensy/td_${pkgver//./}/teensyduino.64bit"
  sha256sums[0]='3047aa2a0482aea9eeafbea0c0a43756c8bda0772aaeff97856e1d70ad16cfaf'
  sha256sums[1]='9d640322f333a00f41dd0e429a00873defcce44306486621e2785774aa4159ac'

  _bits=64
elif [ "$CARCH" == 'i686' ]; then
  _bits=32
fi

build() {
  msg2 "Running Teensyduino installer (takes around 20 seconds)"

  chmod +x "teensyduino.${_bits}bit"
  xvfb-run ./teensyduino.sh "./teensyduino.${_bits}bit" "${srcdir}/arduino-${_arduino}"
}

package() {
  cd "arduino-${_arduino}"

  mkdir -p "${pkgdir}/usr/share/arduino/hardware"
  cp -a hardware/tools "${pkgdir}/usr/share/arduino/hardware/tools"

  rm "${pkgdir}/usr/share/arduino/hardware/tools/"{teensy*,mktinyfat}
}
