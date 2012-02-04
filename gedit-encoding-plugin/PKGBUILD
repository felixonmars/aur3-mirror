pkgname="gedit-encoding-plugin"
pkgver=0.1
pkgrel=4
pkgdesc="Reopen file with different encoding"
url="https://bugzilla.gnome.org/show_bug.cgi?id=342918"
license=("custom")
arch=('any')
depends=('gedit>=3' 'pygtk')
source=("encodingpy.py"
        "encoding.plugin")

build() {
    cd $srcdir
    install -d $pkgdir/usr/lib/gedit/plugins
    install -m644 encoding.plugin encodingpy.py $pkgdir/usr/lib/gedit/plugins
}

md5sums=('7e75a1a143925ca90eaeeaea10b0e5ec'
         '3edf4b5ff6ad4c83873c2e6d54be885a')

