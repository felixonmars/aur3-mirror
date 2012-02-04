# Contributor: wantilles <wantilles@adslgr.com>

pkgname=amule-remote-upnp-svn
pkgver=9607
pkgrel=1
lateststablever=2.2.5
pkgdesc="An eMule-like client for ed2k p2p network"
arch=('i686' 'x86_64')
url="http://www.amule.org/"
license=('GPL')
backup=('etc/conf.d/amule.conf')
depends=('wxgtk>=2.8.0.1' 'gd>=2.0.34' 'binutils>=2.17.50.0.18' 'geoip' 'libupnp>=1.6.6')
makedepends=('crypto++')
replaces=('amule-remote-svn' 'amule-remote' 'amule-remote-noupnp' 'amule-remote-noupnp-svn')
conflicts=('amule' 'amule-svn' 'amule-remote-svn' 'amule-remote' 'amule-noupnp-svn' 'amule-noupnp' 'amule-remote-noupnp' 'amule-remote-noupnp-svn')
provides=("amule=${lateststablever}" "amule-remote=${lateststablever}" "amule-svn=${pkgver}")
source=(http://amule.sourceforge.net/tarballs/aMule-SVN-r${pkgver}.tar.bz2
        amule.conf
        amuled)
md5sums=('763c8729efdfbad2d1bb16ac25fc7ab7' '6652f53c665776faab107c6ba573ce26'\
         '844d48ebff1d888f5894319cd2bc6457')

build() {
  cd ${srcdir}/aMule-SVN-r${pkgver}
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

