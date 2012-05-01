# Maintainer: Patrick Hanckmann <hanckmann@gmail.com>

pkgname=freecbr
pkgver=1.1.4
pkgrel=2
pkgdesc="Case Based Reasoning is a technology to make a similarity based selection from a predefined set of cases. Each case is defined by a set of features. After some cases are stored it is possible to perform a search by specifying search feature values."
arch=('any')
url="http://freecbr.sourceforge.net"
license=('BSD')
depends=('java-runtime')
source=("http://freefr.dl.sourceforge.net/project/freecbr/freecbr/1.1.4/FreeCBR_1.1.4.zip")
md5sums=('460088ed4199246047f05a87e481d879')

package() {
	install -d "${pkgdir}/usr/share/freecbr" \
		"${pkgdir}/usr/bin"
	cp -dpr --no-preserve=ownership ${srcdir}/* "${pkgdir}/usr/share/freecbr/"
	echo "#!/bin/bash" > "$srcdir/FreeCBR.sh"
	echo "java -jar /usr/share/freecbr/FreeCBR.jar" >> "$srcdir/FreeCBR.sh"
	find $pkgdir -type d -exec chmod 755 {} \;
	find $pkgdir -type f -exec chmod 644 {} \;
	install -D -m755 "$srcdir/FreeCBR.sh" "$pkgdir/usr/bin/freecbr"
}
