# Maintainer: Mariano Street <mstreet@kde.org.ar>

pkgname=sapphire-desktop-git
_basename=sapphire
pkgver=20111220
pkgrel=1
pkgdesc='Innovative and usability-oriented desktop environment'
arch=(i686 x86_64)
url="http://delphosproject.org/desktop"
license=('GPL')
groups=('sapphire')
depends=('qt' 'libdelta' 'libxtst' 'openbox' 'wmctrl' 'xbindkeys')
makedepends=('qt' 'libdelta' 'git' 'cmake' 'patch')
optdepends=('xterm: default terminal emulator'
            'scope-git: Sapphire file manager'
            'lcl-git: Live Command Line')
provides=('sapphire-desktop')
source=(radialmenuhelper.patch)
md5sums=('bf4323af62abcb69a74143f6a1391707')

_gitroot="git://gitorious.org/delphos/$_basename.git"
_gitname="$_basename"

build ()
{
    cd "$srcdir"
    msg 'Connecting to GIT server....'
    
    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin
        msg 'The local files are updated.'
    else
        git clone $_gitroot $_gitname
    fi
    
    msg 'GIT checkout done or server timeout.'
    msg 'Starting make...'
    
    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    
    patch -Nup0 <"$startdir/radialmenuhelper.patch"
    
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package ()
{
    cd "$srcdir/$_gitname-build/build"
    make DESTDIR="$pkgdir" install
}
