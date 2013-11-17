# Maintainer: FX-Ti <zjxiang1998@gmail.com>
# Contributor: FX-Ti <zjxiang1998@gmail.com>

pkgname=io-git-simply
pkgrel=1
pkgver=20110912
pkgdesc='Official language VM,Doc,Demo and etc. This is only a packing version in order to make it easy to install and enjoy it! But I find one package just like this after I created this one...'
url='http://iolanguage.org/'
license=('GPL')
arch=('any')


build() {
	git clone https://github.com/stevedekorte/io.git source
	cd source/
	./build.sh
}

package() {
	cd source/build
	make DESTDIR="${pkgdir}" install
}
