# Maintainer: josephgbr <rafael.f.f1@gmail.com>

# Compatible with teeworlds 0.6.3

pkgname=teeworlds-tw-plus
pkgver=0.7.5
pkgrel=1
pkgdesc="A customized server by TT <3, providing submods like iCTF+, etc (TW+)"
arch=('i686' 'x86_64')
url="https://www.teeworlds.com/forum/viewtopic.php?id=9431"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2' 'teeworlds')
makedepends=('python' 'bam' 'mesa')
source=(https://github.com/Teetime/teeworlds/archive/v$pkgver.tar.gz
        server.sh.in README
        ctf4_darkgreen.map ifreeze2.1.map ifreeze2.2.map)
md5sums=('7aa2a4118d2da5b17b2c5536b10a983f'
         '529146a3b13993770fa414f66c67fa26'
         '3fdfd5a245c083cb73dc833d113d39f9'
         'f9fcd5f437c6e5906d3a99b6af0851e0'
         'fbf8ec3246900f3fe53e1cca7d4f89c8'
         'a4c0a0e3f7bc455d5c7486f184a68232')

build() {
  cd teeworlds-$pkgver
  bam server_release
}

package() {
  cd teeworlds-$pkgver
  
   # create dirs
  install -dm755 "$pkgdir"/usr/bin \
                 "$pkgdir"/usr/share/$pkgname \
                 "$pkgdir"/usr/share/doc/$pkgname \
                 "$pkgdir"/usr/share/teeworlds/data/maps/

   # install files from source=()
  install -m755 tw+_srv "$pkgdir"/usr/share/$pkgname/teeworlds_srv
  install -m644 banmasters.cfg "$pkgdir"/usr/share/$pkgname/
  install -m644 sample-ictf.cfg "$pkgdir"/usr/share/$pkgname/
  install -m644 sample-ifreeze.cfg "$pkgdir"/usr/share/$pkgname/
  install -m644 ../README "$pkgdir"/usr/share/doc/$pkgname/
  for map in ctf4_darkgreen.map ifreeze2.1.map ifreeze2.2.map; do
    install -m644 $srcdir/$map "$pkgdir"/usr/share/teeworlds/data/maps/
  done
  
   # set iCTF+ script and cfg file
  install -m755 $srcdir/server.sh.in "$pkgdir"/usr/bin/teeworlds-ictf+_srv
  sed -i "$pkgdir"/usr/bin/teeworlds-ictf+_srv \
      -e "s/@MODNAME@/$pkgname/" \
      -e "s/server.cfg/sample-ictf.cfg/"
  sed -i "$pkgdir"/usr/share/$pkgname/sample-ictf.cfg \
      -e 's/sv_map.*/sv_map ctf4_darkgreen/'
  
   # set iFreeze script and cfg file
  install -m755 $srcdir/server.sh.in "$pkgdir"/usr/bin/teeworlds-ifreeze_srv
  sed -i "$pkgdir"/usr/bin/teeworlds-ifreeze_srv \
      -e "s/@MODNAME@/$pkgname/" \
      -e "s/server.cfg/sample-ifreeze.cfg/"
  sed -i "$pkgdir"/usr/share/$pkgname/sample-ifreeze.cfg \
      -e 's/sv_map.*/sv_map ifreeze2.1/'
}
