# Maintainer: Martin Harvan <martinhrvn at gmail dot com>
pkgname=jboss4
pkgver=4.2.3.GA
pkgrel=1
pkgdesc="JBoss Application Server by RedHat"
arch=('i686' 'x86_64')
url="http://www.jboss.org/"
license=('LGPL')
depends=('java-environment')
makedepends=('java-environment' 'unzip')
backup=()
source=(http://downloads.sourceforge.net/sourceforge/jboss/jboss-${pkgver}.zip
	jboss4.sh
	jboss4)
md5sums=('d1ded1cc876733fec96b5e2934c81220'
	 '2a9821f0d753ab610af0497a49fcd99d'
	 '7cdd6ae8d7a4d459135217cefe253409')

build() {
  cd ${srcdir}/jboss-${pkgver}
  rm -f bin/*.{bat,exe}
  mkdir -p ${pkgdir}/usr/share
  mv ${srcdir}/jboss-${pkgver} ${pkgdir}/usr/share/${pkgname}

  install -D -oroot -groot -m755 ${startdir}/jboss4 ${startdir}/pkg/etc/rc.d/jboss4
  install -D -oroot -groot -m755 ${startdir}/jboss4.sh ${startdir}/pkg/etc/profile.d/jboss4.sh
}
