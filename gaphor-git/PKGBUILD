# Contributor: Giedrius Slavinskas <giedrius25@gmail.com>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>

pkgname=gaphor-git
pkgver=20120623
pkgrel=1
pkgdesc="An easy to use modeling environment for UML design"
arch=('i686' 'x86_64')
url="http://gaphor.sourceforge.net/"
license=('GPL')
depends=('gaphas-git' 'python2-zope-component' 'python-simplegeneric' 'etk-docking')
makedepends=('python2-distribute')
conflicts=('gaphor')
replaces=('gaphor')
provides=('gaphor' 'gaphor-git')
source=()
install="$pkgname.install"
md5sums=()

_gitroot="git://github.com/amolenaar/gaphor.git"
_gitname="gaphor"

build() {
    msg "Connecting to github.com GIT server...."

    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build

    cd ${srcdir}/$_gitname-build

    python2 setup.py build
}

package() {
    cd ${srcdir}/$_gitname-build

    python2 setup.py install --root="${pkgdir}/" 

    # desktop
    sed -i "s/gaphor-48x48\.png/gaphor\.svg/g" $_gitname.desktop
    install -Dm644 $_gitname.desktop \
      "$pkgdir/usr/share/applications/$_gitname.desktop"

    # icon
    install -Dm644 iconsrc/$_gitname.svg \
      "$pkgdir/usr/share/pixmaps/$_gitname.svg"

    # python2 fix
    sed -i "s/\(#\!.*python\).*/\12/" \
      `grep -rl "#\!.*python" "$pkgdir"`
}
