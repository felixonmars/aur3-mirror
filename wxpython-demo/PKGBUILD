# Contributor: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=wxpython-demo
pkgver=3.0.0.0
pkgrel=1
pkgdesc="The source code for the wxPython demo and other sample applications."
url="http://www.wxpython.org"
depends=('wxpython')
license=('GPL')
arch=('any')
source=("http://downloads.sourceforge.net/wxpython/wxPython-demo-${pkgver}.tar.bz2" "wxpython-demo.desktop")
md5sums=('1b06b6f484a5cca85b8d67107331077d' 'fa78a5fe8cb150ef7e8629c11a4919be')
options=(!strip)

build() {
    echo ""
}

package() {
	mkdir -p $pkgdir/opt/wxpython-demo
	mkdir -p $pkgdir/usr/share/applications

	cd $srcdir/wxPython-$pkgver/
	cp -r *  $pkgdir/opt/wxpython-demo/

	cp $srcdir/wxpython-demo.desktop $pkgdir/usr/share/applications/
}
