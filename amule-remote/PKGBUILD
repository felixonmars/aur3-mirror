# Contributor: wantilles <wantilles@adslgr.com>
# Maintainer: halim <sagikliwon@gmail.com>

pkgname=amule-remote
pkgver=2.2.6
pkgrel=1
pkgdesc="An eMule-like client for ed2k p2p network"
arch=('i686' 'x86_64')
url="http://www.amule.org/"
license=('GPL')
backup=('etc/conf.d/amule.conf')
depends=('wxbase>=2.8.0.1' 'libpng' 'binutils>=2.17.50.0.18' 'geoip')
makedepends=('crypto++')
conflicts=('amule' 'amule-svn' 'amule-remote-svn' 'amule-noupnp-svn' 'amule-remote-noupnp-svn' 'amule-noupnp')
provides=("amule=${pkgver}")
source=(http://downloads.sourceforge.net/sourceforge/amule/aMule-${pkgver}.tar.bz2
        amule.conf
        amuled)
md5sums=('530d9b48187e36f78fc21bb19e94326d'
         '6652f53c665776faab107c6ba573ce26'
	 '6d4c07da93a116d87a44188186fbf3b9')

build() {
  cd ${srcdir}/aMule-${pkgver}

  ./configure --prefix=/usr --mandir=/usr/share/man \
              --disable-monolithic --enable-amule-daemon \
              --enable-amulecmd \
              --enable-webserver \
	      --enable-cas \
              --disable-debug \
	      --enable-optimize

  make CC="gcc" || return 1
  make DESTDIR=${pkgdir}/ install || return 1

  install -D -m755 ${startdir}/amuled ${pkgdir}/etc/rc.d/amuled
  install -D -m644 ${startdir}/amule.conf ${pkgdir}/etc/conf.d/amule.conf
}

