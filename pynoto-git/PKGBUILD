# Maintainer: D.Zhukov <zjesclean@gmail.com>
pkgname=pynoto-git
pkgver=20120119
pkgrel=1
pkgdesc="IDE for pyqt, python 3. GIT version."
arch=('i686' 'x86_64')
url="http://code.google.com/p/pynoto/"
license=('GPL')
groups=('devel')
depends=('python' 'qscintilla' 'qt')
makedepends=('qscintilla' 'git' 'python')
provides=('pynoto')
optdepends=()
options=()
#source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #generate with 'makepkg -g'
_gitroot="https://code.google.com/p/pynoto/"
_gitname="pynoto"
install=$_gitname.install

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi
    cd "$srcdir/$_gitname"
    qmake -recursive qtpynoto.pro
    make
    cd ../..
}

package() {
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/lib/pynoto/
    mkdir -p $pkgdir/usr/share/pynoto/
    cp "$srcdir/$_gitname/bin/qtpynoto" "$pkgdir/usr/bin/"
    cp -r "$srcdir/$_gitname/bin/plugins/" "$pkgdir/usr/lib/pynoto/"
    cp -r "$srcdir/$_gitname/bin/python3/" "$pkgdir/usr/share/pynoto/"
}
