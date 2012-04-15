# Maintainer: Siarhei Hanchuk <siarheihanchuk@gmail.com>

pkgname=eclipse-wb
pkgver=1.3.0
pkgrel=1
pkgdesc="Powerful and easy to use bi-directional Java GUI designer"
url="http://www.eclipse.org/windowbuilder/"
license="Eclipse Public License"
arch=('any')
depends=('eclipse>=3.7')
options=(!strip)
source=("http://download.eclipse.org/windowbuilder/WB/integration/WB_v"$pkgver"_UpdateSite_for_Eclipse3.7.zip")
md5sums=('871a84f3931b579db1eebe9c350871e7')

package() {
	cd $srcdir
	rm -r images/ web/ index.html site.xml artifacts.jar content.jar
	find . -type f | while read file; do
		install -Dm644 "$file" "$pkgdir/usr/share/eclipse/dropins/$file"
	done
}
