# Contributor: rabyte <rabyte__gmail>

pkgname=packetgarden
pkgver=1.0
pkgrel=3
pkgdesc="An application that captures information about your internet usage to create an explorable 3D world"
arch=('i686' 'x86_64')
url="http://www.packetgarden.com/"
license=('unknown')
depends=('python-geoip' 'soya' 'libpcap' 'pypcap' 'dpkt' 'gksu' 'pil' 'sdl' 'openal')
install=$pkgname.install
source=(http://selectparks.net/~julian/pg/dists/${pkgname}_${pkgver}_all.tar.gz \
	$pkgname.sh)
md5sums=('7f639c59b097a34a72d95ad89e7cabe7'
         '5dada40690f9f7f1628fc95ebe75f601')

build() {
  cd $srcdir

  # fix path to python binary
  sed 's|python2.4|python|g' -i trunk/pg_{packet,garden,player}.py

  mkdir -p $pkgdir/usr/share
  cp -rf trunk/ $pkgdir/usr/share/packetgarden/
  install -m755 -D packetgarden.sh $startdir/pkg/usr/bin/packetgarden

  # remove junk
  rm -f $startdir/pkg/usr/share/packetgarden/*.{txt,sh}
}
