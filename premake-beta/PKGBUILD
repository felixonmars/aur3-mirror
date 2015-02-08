# Maintainer: Christian Menard <chrism333@gmx.de>
# Contributor: Hannes Steffenhagen <cubicentertain@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: revel <revelÎ˜muubÂ·net>
# Contributor: Marcos J. S. Magalhaes <mjsmagalhaes ^dot^ insc _at_ gmail ~dot~ com>
pkgname=premake-beta
pkgver=4.4_beta5
pkgrel=1
pkgdesc="A simple build configuration and project generation tool using lua"
arch=('i686' 'x86_64')
url="http://industriousone.com/premake"
license=('BSD')
provides=("premake4")
_pmver=${pkgver%_*}
_ver=${pkgver//_/-}
source=("http://downloads.sourceforge.net/project/premake/Premake/$_pmver/premake-$_ver-src.zip")
md5sums=('4fe6eb000726d75621a99080b2466d4d')
build() {
cd "$srcdir/premake-$_ver/build/gmake.unix"
make
}
package() {
install -Dm755 "$srcdir/premake-$_ver/bin/release/premake4" "${pkgdir}/usr/bin/premake4"
} 
