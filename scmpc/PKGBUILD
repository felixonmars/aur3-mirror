# Contributor: Mark Taylor <skymt0@gmail.com>
pkgname=scmpc
pkgver=0.4.1
pkgrel=2
pkgdesc="Audioscrobbler client daemon for mpd"
arch=('i686' 'x86_64')
url="http://cmende.github.com/scmpc"
license=('GPL2')
backup=(etc/scmpc.conf)
depends=('confuse' 'curl' 'glib2' 'libmpdclient' 'pkg-config')
options=(emptydirs)
#https://bitbucket.org/cmende/scmpc/downloads/scmpc-0.4.1.tar.gz
source=($pkgname-$pkgver.tar.bz::https://bitbucket.org/cmende/scmpc/downloads/$pkgname-$pkgver.tar.gz
	scmpcd)
changelog=scmpc.changelog

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure \
  	--prefix=/usr \
  	--sysconfdir=/etc \
  make
  make DESTDIR=${pkgdir} install
  install -Dv -m 755 ${srcdir}/${source[1]} ${pkgdir}/etc/rc.d/scmpcd
  install -Dv -m 644 ${srcdir}/${pkgname}-${pkgver}/scmpc.conf.example ${pkgdir}/etc/scmpc.conf
  install -d -m 755 ${pkgdir}/var/lib/scmpc/
  install -d -m 755 ${pkgdir}/usr/share/doc/scmpc/
  install -v -m 644 {ChangeLog,NEWS,AUTHORS,COPYING} ${pkgdir}/usr/share/doc/scmpc
}

sha1sums=('3ab66bdaf602b1144e7ffad90803370ee4e2864d'
          '4049ff869ac30b8238ef840a5d5243f591c8eb14')
