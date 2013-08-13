# Maintainer: Mateusz Kaczmarek <mateusz.kaczmarek at gmail dot com>

pkgname=retrospective
pkgver=3.0.0
pkgrel=1
pkgdesc="Retrospective is a highly flexible and powerful tool for finding small or large data in your log files."
arch=('i686' 'x86_64')
url="http://www.retrospective.centeractive.com"
license=('custom')
depends=('java-environment')
source=(retrospective.desktop)
md5sums=('6d3b36915909af17e3269f516ed37d60')

if [[ $CARCH == 'i686' ]]; then
	source+=(retrospective_linux-${pkgver}.tar.gz"::http://static.retrospective.centeractive.com/software/current/Retrospective-linux-32bit.tar.gz")
	md5sums=('6fe49177c719426fa792978ea4219433')
elif [[ $CARCH == 'x86_64' ]]; then
	source+=(retrospective_linux-${pkgver}.tar.gz"::http://static.retrospective.centeractive.com/software/current/Retrospective-linux-64bit.tar.gz")
	md5sums+=('fc4fa4b5e8ed7c92100085c135c2ae1c')
fi

build() {
	cd "${srcdir}"
	tar -xf retrospective_linux-${pkgver}.tar.gz
}

package() {
	mkdir -p "${pkgdir}"/opt/retrospective3

	cd "${srcdir}"
  
	cp -dr --no-preserve=ownership Retrospective*/* "${pkgdir}"/opt/retrospective3
	install -D -m644 $srcdir/retrospective.desktop $pkgdir/usr/share/applications/retrospective.desktop
}
