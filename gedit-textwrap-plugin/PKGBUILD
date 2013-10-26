pkgname="gedit-textwrap-plugin"
pkgver=0.2.1
pkgrel=4
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

md5sums=('dab3724a0f057a94fc4c44251a497f23'
         'd278964f796ed64664764280eb35a0bf')
