# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Orivej Desh <masecretaire@gmx.fr>

pkgname=sonic-visualiser32
pkgver=1.8
pkgrel=2
pkgdesc="A viewer and analyser of music audio files."
arch=('i686' 'x86_64')
url="http://www.sonicvisualiser.org/"
license=('GPL2')
depends=('qt' 'liblrdf' 'bzip2' 'rubberband' 'liblo' 'libid3tag' 'redland'
         'libmad' 'libfishsound' 'libpulse' 'liboggz' 'portaudio' 'jack')
source=("http://downloads.sourceforge.net/sv1/sonic-visualiser-$pkgver-linux-32bit.tar.gz")
md5sums=('d158d9282983cb93e0a593538fbed65f')


package() {
  cd "${srcdir}/sonic-visualiser-${pkgver}-linux-32bit"
  mkdir -p "$pkgdir/usr/bin/"
  install  sonic-visualiser "$pkgdir/usr/bin/"
}