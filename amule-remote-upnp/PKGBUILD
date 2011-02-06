# Contributor: wantilles <wantilles@adslgr.com>

pkgname=amule-remote-upnp
pkgver=2.2.6
pkgrel=1
pkgdesc="An eMule-like client for ed2k p2p network"
arch=('i686' 'x86_64')
url="http://www.amule.org/"
license=('GPL')
backup=('etc/conf.d/amule.conf')
depends=('wxgtk>=2.8.10.1' 'gd>=2.0.35' 'geoip' 'binutils>=2.19.1' 'libupnp>=1.6.6')
makedepends=('crypto++')
conflicts=('amule' 'amule-svn' 'amule-remote-svn' 'amule-remote' 'amule-noupnp-svn' 'amule-remote-noupnp-svn' 'amule-noupnp')
provides=("amule=${pkgver}" "amule-remote=${pkgver}")
source=(http://downloads.sourceforge.net/sourceforge/amule/aMule-${pkgver}.tar.bz2
        amule.conf
        amuled)
md5sums=('530d9b48187e36f78fc21bb19e94326d' '6652f53c665776faab107c6ba573ce26'\
         '844d48ebff1d888f5894319cd2bc6457')

build() {
  cd ${srcdir}/aMule-${pkgver}
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-optimize \
              --enable-ccache \
              --enable-amulecmd \
              --enable-amule-daemon \
	      --enable-remote \
	      --enable-webserver \
              --enable-cas \
              --enable-alcc \
              --enable-upnp \
	      --enable-geoip \
	      --disable-monolithic \
              --disable-wxcas \
              --disable-amule-gui \
              --disable-alc \
              --disable-debug
  make || return 1
  make DESTDIR=${pkgdir}/ install || return 1

  install -D -m755 ${startdir}/amuled ${pkgdir}/etc/rc.d/amuled
  install -D -m644 ${startdir}/amule.conf ${pkgdir}/etc/conf.d/amule.conf
}

