# Maintainer:  eomarjee <eyaz.omarjee+arch@gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Oleg Smirnov (oleg.smirnov@gmail.com)
# Contributor: angrycore (angrycore@gmail.com)
# Contributor: Christophe Guéret (christophe.gueret@gmail.com)
# Contributor: David Costa (david@zarel.net)

pkgname="omnetpp"
pkgver=4.6
pkgrel=1
pkgdesc="Component-based simulation package designed for modeling communication networks"
url="http://www.omnetpp.org"
license=("Academic Public License")
depends=('tcl' 'tk' 'blt')
makedepends=('libxml2' 'bison' 'flex')
arch=('i686' 'x86_64')
optdepends=('openmpi: message passing library for parallel simulation',
  'java-runtime-common: for using OMNeT++/OMNEST IDE')
source=(
	"http://www.omnetpp.org/download/release/$pkgname-$pkgver-src.tgz"
	"OMNeT++.desktop")
sha512sums=(
	'48251de7fabd1340e4b0b2272faea620e7f009e602c78e8a28abb9b1f55216f7e6ecf921292f27d143fc6adebbf0667b66508f834b4322930c7cafccfc3099f6'
	'064bb4747e9985dab8480de69978e2258111a38a7d49bb24c36f1ac070058bb2149bb4d2b2fd15d5a35f0ce02bf47e1d212a74397afd07a40a68b5eab7decfd1'
)

build() {
	cd $srcdir/$pkgname-$pkgver

	PATH=$PATH:$srcdir/$pkgname-$pkgver/bin

	./configure --prefix=/usr

	sed -i 's!IDEDIR=.*!IDEDIR=/opt/omnetpp/ide!' src/utils/omnetpp src/utils/omnest
	sed -i 's!osgi.instance.area.default=.*$!#osgi.instance.area.default=/usr/share/omnetpp/samples!g' ide/configuration/config.ini

	make MODE=release -j2 || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver

	install -d $pkgdir/{opt/omnetpp,usr/{bin,include/omnetpp/platdep,lib,share/omnetpp/{images,doc,samples}}}
	install -m755 bin/* $pkgdir/usr/bin/
	install lib/gcc/* $pkgdir/usr/lib/

	install -m644 include/*.h $pkgdir/usr/include/omnetpp
	install -m644 include/platdep/*.h $pkgdir/usr/include/omnetpp/platdep

	cp -R images/* $pkgdir/usr/share/omnetpp/images
	cp -R doc/* $pkgdir/usr/share/omnetpp/doc
	cp -R samples/* $pkgdir/usr/share/omnetpp/samples

	cp -R ide $pkgdir/opt/omnetpp
	touch $pkgdir/opt/omnetpp/ide/error.log
	chmod a+rw $pkgdir/opt/omnetpp/ide/error.log

	install -D $srcdir/omnetpp-$pkgver/ide/icon.png $pkgdir/usr/share/icons/omnetpp.png
	install -D $srcdir/OMNeT++.desktop $pkgdir/usr/share/applications/OMNeT++.desktop
}
