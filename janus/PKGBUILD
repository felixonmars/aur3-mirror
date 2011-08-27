# Maintainer: JD Steffen <jd AT steffennet DOT org>
pkgname=janus
pkgver=1.3
pkgfilever=13
pkgrel=1
pkgdesc="janus - Dynamic DNS watcher for FreeS/WAN & forks"
arch=('any')
url="http://sourceforge.net/projects/janus-watcher/"
license=('GPL')
depends=('perl')
optdepends=('openswan')
source=(http://sourceforge.net/projects/janus-watcher/files/janus%20watcher/janus%20watcher%20v.1.3/${pkgname}-${pkgfilever}.tgz
	janus.d
	janus.conf.d
	janus.patch)

md5sums=('847aacaf019fd52944cb1299137aadd6'
         'de3e168d077791351eb7e418ce3f17bf'
         '19da358588ecda450172ceefc4884e1f'
         'daac6035cbe00d3df44fe3a60262973e')

build() {
  
  cd ${srcdir}
  patch -p0 -i janus.patch
  cd ..
  install -Dm755 ${srcdir}/janus ${pkgdir}/usr/bin/janus
  install -Dm755 janus.d ${pkgdir}/etc/rc.d/janus
  install -Dm644 janus.conf.d ${pkgdir}/etc/conf.d/janus	
}

