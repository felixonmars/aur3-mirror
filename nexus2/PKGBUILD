#Contributor: Markus M. May <mmay AT javafreedom DOT org>
#Maintainer:  Yahya Mohajer <yaya_2013 {AT} yahoo {DOT} com >

pkgname=nexus2
pkgver=2.3.1
patchver=01
pkgrel=3
pkgdesc="A Maven Repository Manager. Nexus 2"
url="http://nexus.sonatype.org"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('java-environment')
optdepends=('apache: a full featured webserver'
            'maven: a java project management and project comprehension tool')

install=nexus2.install
backup=(opt/nexus/bin/jsw/conf/wrapper.conf)
conflicts=( 'nexus')
provides=('java-nexus' 'nexus2')
options=(!strip !docs)

source=(http://www.sonatype.org/downloads/nexus-${pkgver}-${patchver}-bundle.tar.gz
        'nexus'
        'nexus.properties'
	'nexus.service')	

md5sums=('dea1bd07c25ad51269af6f2c936f2004'
         'fee6289e0ee48ee5705da54660f7595d'
         '72b1d390e53cab14fabfa6e567f19114'
	'ac7c0c60bb3c77ff67965ec160ef2517')

build() {
  cd ${srcdir}

  # Create directories
  install -d $pkgdir/opt/nexus
 

  # move documentation to the right location
  mkdir -p $pkgdir/usr/share/doc/nexus
  install $srcdir/nexus-$pkgver-$patchver/*.txt $pkgdir/usr/share/doc/nexus
  rm $srcdir/nexus-$pkgver-$patchver/*.txt

  # move example configuration to the right location
  mkdir -p $pkgdir/usr/share/doc/nexus/conf
  mv $srcdir/nexus-$pkgver-$patchver/conf/examples $pkgdir/usr/share/doc/nexus/conf

  mkdir -p $pkgdir/var/lib/nexus
  mkdir -p $pkgdir/opt/nexus/run

  # copy the source to the final directory
  cp -a $srcdir/nexus-${pkgver}-${patchver}/* $pkgdir/opt/nexus || return 1
  install $srcdir/nexus $pkgdir/opt/nexus/bin/nexus

  install $srcdir/nexus.properties $pkgdir/opt/nexus/conf/nexus.properties || return 1

  install -Dm644 "${srcdir}/nexus.service" "${pkgdir}/usr/lib/systemd/system/nexus.service"

}
