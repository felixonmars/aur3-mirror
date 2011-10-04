# Maintainer: Ray Powell <ray_al@xphoniexx.net>
# Changelog: 2011-10-04 Updated to 0.94, fixed desktop icons not being installed correctly

pkgname=mcomix
pkgver=0.94
pkgrel=1
pkgdesc="A comic book viewer forked from comix"
#arch=('i386' 'x86_64')
arch=('any')
url="http://sourceforge.net/projects/mcomix/"
license=('GPL')
depends=('pygtk' 'pil' 'unrar' 'xdg-utils' 'python2' 'desktop-file-utils' 'hicolor-icon-theme' 'python2-distribute')
makedepends=('gettext' 'intltool')
conflicts=('comix')
install=mcomix.install
source=(http://downloads.sourceforge.net/project/mcomix/MComix-${pkgver}/mcomix-${pkgver}.tar.bz2)
md5sums=('46a1e9f7c99ebb29325c9925069fa6ea')
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	# python2 fix
	for file in $(grep -Rl "/usr/bin/env python" ./);
	do
		sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
	done

        export PYTHONPATH=${pkgdir}/usr/lib/python2.7/site-packages/
        mkdir -p $PYTHONPATH
        python2 setup.py install --prefix ${pkgdir}/usr

}

package() {
	
	#Create needed directory structure
	mkdir -p ${pkgdir}/usr/share/icons/hicolor
	mkdir -p ${pkgdir}/usr/share/applications
	cd ${srcdir}/${pkgname}-${pkgver}

	cp -r ${pkgname}/images ${pkgdir}/usr/share/${pkgname}/
	cp -r mime/icons/* ${pkgdir}/usr/share/icons/hicolor/

    install -D -m644  mcomix/images/22x22/mcomix.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/mcomix.png
    install -D -m644  mcomix/images/16x16/mcomix.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/mcomix.png
    install -D -m644  mcomix/images/24x24/mcomix.png ${pkgdir}/usr/share/icons/hicolor/24x24/apps/mcomix.png
    install -D -m644  mcomix/images/32x32/mcomix.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/mcomix.png
    install -D -m644  mcomix/images/48x48/mcomix.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/mcomix.png

	install -D -m644 mime/comicbook.schemas ${pkgdir}/usr/share/gconf/schemas/mcomix.schemas
	install -D -m644 mime/comicthumb.1.gz ${pkgdir}/usr/share/man/man1/comicthumb.1.gz
	install -D -m644 mime/${pkgname}.desktop ${pkgdir}/usr/share/applications/

	rm ${pkgdir}/usr/bin/easy_install-2.7 
	rm ${pkgdir}/usr/lib/python2.7/site-packages/*.p*
}
