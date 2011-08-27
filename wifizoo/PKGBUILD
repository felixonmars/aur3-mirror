# Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>
pkgname=wifizoo
pkgver=1.3
pkgrel=4
pkgdesc="Tool to gather wifi information passively"
arch=('i686' 'x86_64')
url="http://community.corest.com/~hochoa/wifizoo/"
license=('GPL')
depends=('python2' 'scapy' 'graphviz')
install=wifizoo.install
source=(http://community.corest.com/~hochoa/wifizoo/${pkgname}_v${pkgver}.tgz
	wifizoo_scapy.patch
	wifizoo.initscript
	wifizoo.initscriptconf)
md5sums=('9e6e4ff060eb92b4a75c07c744156df8'
	'9b88d31703bb6c2abfb9e2367eee83d5'
	'437fc4b66937baf6ca24045edbf3cd3e'
	'aa3783ad3ff877485816ffecf5133835')

build() {
  cd ${srcdir}/${pkgname}_v${pkgver}
  patch -Np1 -i ../wifizoo_scapy.patch wifizoo.py || return 1
}

package() {
  cd ${srcdir}/${pkgname}_v${pkgver}
  
  mkdir -p ${pkgdir}/opt
  mkdir -p ${pkgdir}/usr/sbin

  cp -R ${srcdir}/${pkgname}_v${pkgver} ${pkgdir}/opt/wifizoo || return 1
  
  install -D -m755 ${startdir}/src/wifizoo.initscript ${startdir}/pkg/etc/rc.d/wifizoo || return 1
  install -D -m755 ${startdir}/src/wifizoo.initscriptconf ${startdir}/pkg/etc/conf.d/wifizoo || return 1
}
