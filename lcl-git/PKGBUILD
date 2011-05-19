# Maintainer: Mariano Street <mstreet@kde.org.ar>

pkgname=lcl-git
_basename=lcl
pkgver=20110516
pkgrel=1
pkgdesc='Live Command Line from the Sapphire desktop environment'
arch=(i686 x86_64)
url="http://gitorious.org/delphos/$_basename"
license=('GPL3')
groups=('sapphire')
depends=('qt' 'dbus')
makedepends=('qt' 'git')
optdepends=('sapphire-desktop: innovative and usability-oriented desktop environment')
provides=('lcl')

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
    
    qmake
    make
}

package ()
{
    cd "$srcdir/$_gitname-build"
    mkdir -p "$pkgdir/usr/bin"
    cp lcl "$pkgdir/usr/bin"
} 
