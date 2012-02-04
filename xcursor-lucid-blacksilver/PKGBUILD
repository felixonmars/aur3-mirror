#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-lucid-blacksilver
pkgver=1.0
pkgrel=3
pkgdesc="Lucid BlackSilver cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/Lucid-BlackSilver?content=105209"
license=('Artistic 2.0')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/105209-Lucid-BlackSilver.tar.gz")
md5sums=('f414b68f351dafaaef4cf51a9d7e0f93')

build() {
	cd $startdir/src/Lucid-BlackSilver
	install -d -m755 $startdir/pkg/usr/share/icons/lucidblackSilver/cursors
	cd $startdir/src/Lucid-BlackSilver/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/lucidblackSilver/cursors
	done
}