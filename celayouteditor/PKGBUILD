# Maintainer: Jerome Rose <jrose.pub at gmail.com>

pkgname=celayouteditor
pkgver=0.7.1
pkgrel=3
pkgdesc="Layout Editor for the Crazy Eddie's GUI Library"
arch=('i686' 'x86_64')
url="http://www.cegui.org.uk"
makedepends=('cegui' 'wxgtk' 'glut')
depends=('cegui' 'wxgtk' 'glut')
optdepents=()
conflicts=()
provides=()
license=('MIT')
source=("http://iweb.dl.sourceforge.net/project/crayzedsgui/CELayoutEditor/$pkgver/CELayoutEditor-$pkgver.tar.gz"
         CELayoutEditor.desktop)

md5sums=('c79179be55a803aa9a3c439292dc4e28'
         '67cc425b5024e2da45195c783f8c2e12')


build() {
    cd "$srcdir/CELayoutEditor-$pkgver"
    #configure didn't add openGL libs by default
    LIBS="-lGLU -lGL" \
    ./configure --prefix=/usr
    
    make
}

package() {
    install -D CELayoutEditor.desktop "$pkgdir/usr/share/applications/CELayoutEditor.desktop"
    cd "$srcdir/CELayoutEditor-$pkgver"
    make DESTDIR="$pkgdir/" install
}
