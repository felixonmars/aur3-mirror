# Maintainer:  smx
# Creator:  mikezackles
# Creator?:    Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: revel <revelΘmuub·net>
# Contributor: Marcos J. S. Magalhaes <mjsmagalhaesinsc@gmail.com>
pkgname=premake5-git
pkgver=5.0.alpha2.r78.g01abeaa
pkgrel=1
pkgdesc='Simple build configuration and project generation tool using Lua'
arch=('i686' 'x86_64')
url='http://industriousone.com/premake'
license=('BSD')
depends=('glibc')
makedepends=('git' 'premake')
provides=('premake5')
source=(git+https://github.com/premake/premake-core.git)
md5sums=('SKIP')

pkgver() {
  cd premake-core
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
	cd premake-core
	git submodule update --init --recursive
}

check(){
	cd premake-core
	./bin/release/premake5 test
}


build() {
  cd premake-core

  premake4 embed
  premake4 gmake

  make config=release
}

package() {
	cd "${srcdir}"
	install -Dm755 premake-core/bin/release/premake5 "$pkgdir"/usr/bin/premake5
}
