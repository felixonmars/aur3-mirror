#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-tracer
pkgver=1.0
pkgrel=1
pkgdesc="Tracer cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/Tracer?content=106686"
license=('Artistic 2.0')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/106686-Tracer.tar.gz")
md5sums=('4dea96b3f36df38f66f3463c1f32e374')

build() {
	cd $startdir/src/Tracer
	install -d -m755 $startdir/pkg/usr/share/icons/tracer/cursors
	cd $startdir/src/Tracer/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/tracer/cursors
	done
}