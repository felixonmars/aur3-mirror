# Contributor: Prurigro
# Maintainer: Prurigro

pkgname=compiz-fusion-plugin-anaglyph
pkgver=0.2.4
pkgrel=1
pkgdesc="Compiz plugin providing 3D effects with red/blue glasses"
arch=('i686' 'x86_64')
url="http://kowalczyk.ws/anaglyph/"
license=('GPL')
source=(http://kowalczyk.ws/anaglyph/anaglyph_$pkgver.tar.gz)
md5sums=('dbbd3b2261599f02dcbec56538de1aa6')

# This sets the depends based on whether you have compiz-core or compiz-git installed
if [ ! -f /usr/bin/compiz ]; then
	echo -n "Please install either 'compiz-core' or 'compiz-git' and try again" && return 1
elif [ $(pacman -Qo /usr/bin/compiz | grep -c compiz-core) = 1 ]; then
	depends=('compiz-core' 'compiz-bcop' 'compiz-fusion-plugins-main')
elif [ $(pacman -Qo /usr/bin/compiz | grep -c compiz-git) = 1 ]; then
	depends=('compiz-git' 'compiz-bcop-git' 'compiz-fusion-plugins-main-git')	
fi

build() {
	pushd ${startdir}/src/anaglyph || return 1
		make || return 1
		install -d ${pkgdir}/usr/lib/compiz || return 1
		install -d ${pkgdir}/usr/share/compiz || return 1
		install -D -m755 build/.libs/libanaglyph.so.0.0.0 ${pkgdir}/usr/lib/compiz/libanaglyph.so.0.0.0 || return 1
		ln -s libanaglyph.so.0.0.0 ${pkgdir}/usr/lib/compiz/libanaglyph.so.0 || return 1
		ln -s libanaglyph.so.0.0.0 ${pkgdir}/usr/lib/compiz/libanaglyph.so || return 1
		install -D -m644 build/anaglyph.xml ${pkgdir}/usr/share/compiz/anaglyph.xml || return 1
	popd
}

