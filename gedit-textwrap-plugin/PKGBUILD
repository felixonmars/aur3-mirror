pkgname="gedit-textwrap-plugin"
pkgver=0.2.1
pkgrel=3
pkgdesc="Toggle Text Wrap Setting by Menu Entry or Toolbar Button"
url="http://hartmann-it-design.de/gedit/TextWrap/"
license=("GPL3")
arch=('any')
depends=('gedit>=3' 'pygtk')
source=("TextWrap.py"
        "TextWrap.plugin")

build() {
    cd $srcdir
    install -d $pkgdir/usr/lib/gedit/plugins
    install -m644 TextWrap.plugin TextWrap.py $pkgdir/usr/lib/gedit/plugins
}

md5sums=('0d18547dacebe144229ed05f3f01c6f3'
         '8ff3cf38c7ac770c071208add0c2f4d3')
