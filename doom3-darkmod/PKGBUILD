# Maintainer: PedsXing <pedsxing at gmx dot net>
# Contributer: Hiroe <ashadocat at gmail dot com>

pkgname=doom3-darkmod
pkgver=1.08
pkgrel=1
pkgdesc="DOOM III mod based on the Thief series by Looking Glass Studios"
arch=('i686' 'x86_64')
url="http://www.thedarkmod.com/"
license=('CCPL')

[ "$CARCH" == i686   ] && depends=('doom3' 'glew' 'libpng' 'libjpeg-turbo')

[ "$CARCH" == x86_64 ] && depends=('doom3' 'lib32-glew' 'lib32-libpng' 'lib32-libjpeg-turbo')

install="$pkgname".install
source=(http://www.bloodgate.com/mirrors/tdm/pub/pk4/tdm_update_linux.zip
        doom3-darkmod
        "$pkgname".desktop
        "$pkgname".png)

md5sums=('edf17a1b5ac1dff67d8bbf2c6076a991'
         '9e06cf55fbc222d71204fbadb8424f9f'
         '02d3ab8c0f402c717d266f514a2502a9'
         '5309e528ce22f28ecc0e9781e43379e0')

build() {
  cd "$srcdir"

  mkdir darkmod
  mv tdm_update.linux darkmod/
  cd darkmod

  chmod +x tdm_update.linux
  ./tdm_update.linux || true

  rm -f *.exe tdm_update.linux
  rm -f crc_info.txt tdm_mirrors.txt tdm_version_info.txt tdm_update.log
}

package() {
  cd "$srcdir"/darkmod

  install -m755 -d "$pkgdir"/opt/doom3/darkmod/
  install -m755 -d "$pkgdir"/usr/bin/
  install -m755 -d "$pkgdir"/usr/share/{applications,icons,licenses/"$pkgname"}

  cp -r * "$pkgdir"/opt/doom3/darkmod/
  find "$pkgdir"/opt/doom3/darkmod/ -type d -exec chmod 755 {} \;
  find "$pkgdir"/opt/doom3/darkmod/ -type f -exec chmod 644 {} \;
  mv "$pkgdir"/opt/doom3/darkmod/thedarkmod.x86 "$pkgdir"/opt/doom3/thedarkmod.x86
  chmod 755 "$pkgdir"/opt/doom3/thedarkmod.x86
  install -m755 "$srcdir"/doom3-darkmod "$pkgdir"/usr/bin/

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  rm -f "$pkgdir"/opt/doom3/darkmod/LICENSE.txt

  install -Dm644 "$srcdir"/"$pkgname".png "$pkgdir"/usr/share/icons/
  install -Dm644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/
}
