# Maintainer: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-pydev-mylyn
pkgver=0.3.0
pkgrel=1
pkgdesc="Mylyn support for Pydev in Eclipse"
arch=('i686' 'x86_64')
url="http://pydev.sourceforge.net/updates/"
license=('EPL')
depends=("eclipse-pydev" "eclipse-mylyn")
makedepends=('unzip')
source=("http://downloads.sourceforge.net/pydev/org.python.pydev.mylyn.feature_$pkgver.zip")
md5sums=('54a8606879bc76a0ec0115460a876ff3')

build() {
	cd $srcdir || return 1
	find features plugins -type f | while read file; do
		install -Dm644 "$file" \
			"${pkgdir}/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse/$file" \
			|| return 1
	done || return 1
}
