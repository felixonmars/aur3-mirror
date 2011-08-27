pkgname="gedit2-textwrap-plugin"
pkgver=0.2.1
pkgrel=1
pkgdesc="Toggle Text Wrap Setting by Menu Entry or Toolbar Button"
url="http://hartmann-it-design.de/gedit/TextWrap/"
license=("GPL3")
arch=('any')
depends=('gedit<3' 'pygtk')
source=("http://hartmann-it-design.de/gedit/TextWrap/TextWrap-Gedit-Plugin-${pkgver}.tar.gz")

build() {
    cd $srcdir/TextWrap-Gedit-Plugin-${pkgver}
    install -d $pkgdir/usr/lib/gedit-2/plugins
    install -m644 TextWrap.gedit-plugin TextWrap.py $pkgdir/usr/lib/gedit-2/plugins
}

md5sums=('3b6b301fe692a2308291b171294e379d')
