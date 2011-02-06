pkgname=texmaker-oxygen-icons
origpkgname=texmaker
pkgver=1.8
pkgrel=2
pkgdesc="The famous free cross-platform latex editor with Oxygen icon theme. Thanks Adria Arrufat for the icon set."
arch=('i686' 'x86_64')
url="http://www.xm1math.net/texmaker/index.html"
license=('GPL')
depends=('qt>=4.3' 'ghostscript')
source=(http://www.xm1math.net/texmaker/$origpkgname-$pkgver.tar.bz2 \
	texmaker.desktop \
	http://www.kde-look.org/CONTENT/content-files/101556-Oxygen_for_texmaker.tar.gz
)
md5sums=('c25bdd9d0dae2be802d53bcc3189d6ea'
         '48ca54ffd5eb98a83cbf3626205b8639'
	 'e62f099a9274a2400690e0a37b105ded'
)

build() {
        cp -f $startdir/src/Oxygen_for_texmaker/images/* $startdir/src/$origpkgname-$pkgver/images
	cd $startdir/src/$origpkgname-$pkgver
	export INSTALL_ROOT=$startdir/pkg
	qmake -unix PREFIX=//usr texmaker.pro
	make || return 1
	make install
	
	rm -f $startdir/pkg/usr/share/texmaker/{*.desktop,COPYING}
	install -D -m644 images/appicon.png \
		$startdir/pkg/usr/share/pixmaps/texmaker.png
	install -D -m644 $startdir/src/$origpkgname.desktop \
		$startdir/pkg/usr/share/applications/$origpkgname.desktop
}

