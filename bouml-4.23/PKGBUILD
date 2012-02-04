# Maintainer: Cedric Sougne <cedric@sougne.name>

pkgname=bouml-4.23
pkgver=p7
pkgrel=1
pkgdesc='A free UML 2 modeler with C++, Idl, Java, PHP and Python code generation'
url='http://bouml.free.fr/'
license=('custom')
arch=('x86_64')
options=('!strip')
depends=('qt3')
conflicts=('bouml')
makedepends=('rpmextract')
source=('bouml-4.23-p7-RHEL5.x86_64.rpm')
md5sums=('243f9fd7c9f4e2c7f59b8a05c9825979')

build() {
	cd $startdir/pkg
	rpmextract.sh $startdir/src/bouml-4.23-p7-RHEL5.x86_64.rpm
}
