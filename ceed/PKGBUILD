# Maintainer: Jerome Rose <jrose.pub at gmail.com>

pkgname=ceed
pkgver=0.0.11
pkgrel=1
snapshot="snapshot11"
pkgdesc="Unified Editor Tool for Crazy Eddie's GUI Library"
arch=('i686' 'x86_64')
url="http://www.cegui.org.uk"
makedepends=('python2-pyside')

# Note: qtwebkit is actualy required by python2-pyside at build time to
# produce the pyqtwebkit module needed by ceed

depends=('cegui' 'python2>=2.7' 'python2-opengl' 'qtwebkit' 'boost-libs')

optdepents=()
conflicts=()
provides=()
license=('MIT')
source=("http://iweb.dl.sourceforge.net/project/crayzedsgui/CEED/$snapshot/ceed-$snapshot.tar.bz2"
        "ceed.desktop")

md5sums=('019a64e3ae9dbd7cf8647cecc3ce5534'
         'f147a66c54bb2720e479ab34b59ce82e')

build() {
    #empty build, python app
    cd "$srcdir"
}

package() {
    #cd "$srcdir/ceed-$snapshot"
    
    install -d "$pkgdir/usr/lib/python2.7"
    cp -r "$srcdir/ceed-$snapshot/ceed" "$pkgdir/usr/lib/python2.7"
    
    install -d "$pkgdir/usr/share/ceed"
    cp -r $srcdir/ceed-$snapshot/data/* "$pkgdir/usr/share/ceed"
    
    cp -r "$srcdir/ceed-$snapshot/bin" "$pkgdir/usr/"
    
    install -d "$pkgdir/usr/share/applications"
    cp ceed.desktop "$pkgdir/usr/share/applications"
    

}

