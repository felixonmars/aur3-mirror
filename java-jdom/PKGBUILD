# Current Maintainer: Kozec <kozec at kozec dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>
# Prev. Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=java-jdom
pkgver=2.0.6
_hash=2e946f8
pkgrel=1
pkgdesc="XML Parsing Library for Java with contributions and tests"
arch=('any')
url="http://www.jdom.org"
license=('GPL')
conflicts=('java-jdom1')
depends=('java-runtime')
makedepends=('apache-ant')
source=(https://github.com/hunterhacker/jdom/tarball/JDOM-${pkgver})

build() {
	cd "$srcdir"/hunterhacker-jdom-${_hash}
	ant jars
	date "+%Y.%m.%d.%H.%M" >buildtime.txt
}

package() {
	cd "$srcdir"/hunterhacker-jdom-${_hash}
	bt=$(cat buildtime.txt)
	install -D -m755 build/package/jdom-2.x-${bt}-contrib.jar \
			${pkgdir}/usr/share/java/jdom/jdom-contrib.jar
	install -D -m755 build/package/jdom-2.x-${bt}.jar \
			${pkgdir}/usr/share/java/jdom/jdom.jar
}

a_build() {
	[ -e core ] || ln -s jdom core
	for _i in core jdom-contrib jdom-test ; do
		pushd ${_i}
		chmod +x build.sh
		./build.sh
		popd
	done
}

a_package() {
	for _i in jdom jdom-test ; do
		install -D -m755 ${_i}/build/${_i}-${pkgver}.jar \
			${pkgdir}/usr/share/java/jdom/${_i}.jar
  	done
	for _i in jdom-contrib ; do
		install -D -m755 ${_i}/build/${_i}-1.1.2-snap.jar \
			${pkgdir}/usr/share/java/jdom/${_i}.jar
  	done
}


md5sums=('85e8760c18881e929d7109f975a5fb62')
md5sums=('58b0f0cd26b4bdc4915fdb7466fa9674')
