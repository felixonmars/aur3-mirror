# Maintainer: Mariano Street <mstreet@kde.org.ar>

pkgname=libdelta-git
_basename=libdelta
pkgver=20111220
pkgrel=1
pkgdesc='Core library from the Sapphire desktop environment'
arch=(i686 x86_64)
url="http://gitorious.org/delphos/$_basename"
license=('GPL')
groups=('sapphire')
depends=('qt')
makedepends=('qt' 'git' 'cmake')
optdepends=('sapphire-desktop-git: innovative and usability-oriented desktop environment')
provides=('libdelta')
source=()
md5sums=()

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
    
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
    make
}

package ()
{
    cd "$srcdir/$_gitname-build/build"
    make DESTDIR="$pkgdir" install
} 
