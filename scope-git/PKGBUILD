# Maintainer: Mariano Street <mstreet@kde.org.ar>

pkgname=scope-git
_basename=scope
pkgver=20110605
pkgrel=1
pkgdesc='Lightweight Qt-based file manager from the Sapphire desktop environment'
arch=(i686 x86_64)
url="http://gitorious.org/delphos/$_basename"
license=('GPL3')
groups=('sapphire')
depends=('qt' 'libdelta')
makedepends=('qt' 'git' 'libdelta')
optdepends=('sapphire-desktop: innovative and usability-oriented desktop environment'
            'lcl: Live Command Line for managing Scope')
provides=('scope')

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
    
    lrelease scope.pro  # Generate translation files.
    qmake
    make $MAKEFLAGS
}

package ()
{
    cd "$srcdir/$_gitname-build"
    make INSTALL_ROOT="$pkgdir" install
    # The license is a common one, so it is not needed in the package.
    rm -r "$pkgdir/usr/share/doc/"
} 
