# Maintainer: Patrick Hanckmann <hanckmann@gmail.com>

pkgname=colibri-studio
pkgver=0.9.Beta
pkgrel=2
pkgdesc="COLIBRI Studio is the implementation of the top layer of the COLIBRI platform. It provides the visual builder tools required to generate Case Base Reasoning systems without dealing directly with the source code. It is built on top of the jCOLIBRI framework."
arch=('any')
url="http://gaia.fdi.ucm.es/research/colibri"
license=('LGPL')
source=("http://switch.dl.sourceforge.net/project/jcolibri-cbr/COLIBRIStudio/colibristudio-linux-gtk-x86_64.tar.gz")
md5sums=('bb296b1235795decad9214bcd005e5ec')

package() {
	install -d "${pkgdir}/usr/share/" \
		"${pkgdir}/usr/bin/"
	cp -dpr --no-preserve=ownership ${srcdir}/* "${pkgdir}/usr/share/"
	echo "#!/bin/bash" > "$srcdir/colibristudio/colibristudio.sh"
	echo "/usr/share/colibristudio/colibristudio" >> "$srcdir/colibristudio/colibristudio.sh"
	find $pkgdir -type d -exec chmod 755 {} \;
	install -D -m755 "$srcdir/colibristudio/colibristudio.sh" "$pkgdir/usr/bin/colibristudio"
}
