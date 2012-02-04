# Contributor: Ganjolinux aka Basalari David . E-mail : ganjolinux@gmail.com 

pkgname=amule-remote-cvs
pkgver=20080819
pkgrel=1
pkgdesc="aMule is a eMule-like client for ed2k p2p network"
arch=('i686' 'x86_64')
license=('GPL')
backup=('etc/conf.d/amule.conf')
url="http://www.amule.org"
depends=('wxgtk>=2.8.0.1' 'gd>=2.0.34' 'binutils>=2.17.50.0.18' 'geoip')
makedepends=('crypto++')
conflicts=('amule' 'amule-remote' 'amule-cvs')
provides=('amule=2.2.0' 'amule-remote=2.2.0')
source=(http://amule.hirnriss.net/aMule-CVS-${pkgver}.tar.bz2
        amule.conf
        amuled)
md5sums=('6439967df45df4a18843c5540faac4ac' '6652f53c665776faab107c6ba573ce26'\
         '4aab4755134c52ddc53b89d350506695')

build() {
  cd ${startdir}/src/amule-cvs
  ./configure --prefix=/usr \
	      --disable-monolithic \
              --disable-wxcas \
              --disable-amule-gui \
              --disable-alc \
              --disable-debug \
              --enable-optimize \
              --enable-ccache \
              --enable-amulecmd \
              --enable-amule-daemon \
	      --enable-remote \
	      --enable-webserver \
              --enable-cas \
              --enable-alcc \
	      --enable-geoip
  make || return 1
  make DESTDIR=${startdir}/pkg install

  install -D -m755 $startdir/amuled $startdir/pkg/etc/rc.d/amuled
  install -D -m644 $startdir/amule.conf $startdir/pkg/etc/conf.d/amule.conf
}

