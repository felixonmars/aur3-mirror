#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-lucid-silver
pkgver=1.0
pkgrel=3
pkgdesc="Lucid Silver cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/Lucid+-+Silver+and+Gold?content=105870"
license=('Artistic 2.0')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/105870-Lucid-Silver.tar.gz")
md5sums=('b9cccbcfeff661266238760b027dc712')

build() {
	cd $startdir/src/Lucid-Silver
	install -d -m755 $startdir/pkg/usr/share/icons/lucidsilver/cursors
	cd $startdir/src/Lucid-Silver/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/lucidsilver/cursors
	done
}

