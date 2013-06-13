# Maintainer: modywzm <modywzm at gmail dot com>
pkgname=pyeject-git
pkgver=20130613
pkgrel=1
pkgdesc="A frontend simple application for eject."
arch=('i686' 'x86_64')
url="http://github.com/modywzm/pyeject"
license=('GPL3')
depends=('pygtk' 'python2')
makedepends=('git')
provides=('pyeject')
source=()
md5sums=()

_gitroot='git://github.com/modywzm/pyeject.git'
_gitname='pyeject'

package() {
    cd "$srcdir"
    msg "Connecting to github.com GIT server...."
    
    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi
    
    msg "GIT checkout done or server timeout"
    
    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    
    install -Dm644 COPYING ${pkgdir}/usr/share/doc/pyeject/COPYING
    
    cd po
    
    for i in *.po; do
        filename=`basename "$i" .po`
        msgfmt "$i" --output-file "$filename.mo"
        install -Dm644 ${filename}.mo ${pkgdir}/usr/share/locale/${filename}/LC_MESSAGES/pyeject.mo
    done
    
    install -Dm644 $srcdir/$_gitname-build/pyeject.desktop ${pkgdir}/usr/share/applications/pyeject.desktop
    install -Dm755 $srcdir/$_gitname-build/pyeject $pkgdir/usr/bin/pyeject
}
