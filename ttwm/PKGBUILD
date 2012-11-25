# Maintainer: Jesse McClure AKA "Trilby" <jmcclure [at] cns [dot] umass [dot] edu>
pkgname=ttwm
pkgver=1.0
pkgrel=1
pkgdesc="Tiny Tiler/Tabbed Tiler Window Manager"
url="http://github.com/TrilbyWhite/ttwm.git"
arch=('any')
conflicts=('ttwm-git')
license=('GPLv3')
depends=('libx11')
source=('https://github.com/TrilbyWhite/ttwm/raw/master/ttwm-1.0.tar.gz')
md5sums=('f660072bd683765cc99a16aa7bbf0fb1')

build() {
    cd "$srcdir"
	if [[ -f ~/.ttwm_conf.h ]]; then
		msg "Using user config from ~/.ttwm_conf.h"
		msg "  Be sure to check for changes to default config.h"
		cp ~/.ttwm_conf.h ./config.h
	else
		msg "Using default config"
	fi
	make
}

package() {
	cd "$srcdir"
	make PREFIX=/usr DESTDIR=$pkgdir install
}

