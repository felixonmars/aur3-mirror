# Maintainer: Mariano Street <mctpyt at delphosproject dot org>.
# Contributor: totoloco.

pkgname='retumilo-hg'
pkgver=108
pkgrel=1
pkgdesc='TTT-legilo kia Vi per Qt kaj WebKit. ¡El ratón Emilio!'
arch=('i686' 'x86_64')
url='http://retumilo.co.cc/'
license=('GPL3')
depends=('qt')
makedepends=('mercurial' 'qt')
#makedepends=('mercurial' 'qt' 'cmake')
optdepends=('tabbed: tab support')
conflicts=('retumilo' 'retumilo-git')
provides=('retumilo')
install='retumilo.install'

_hgroot='http://hg.niwi.be'
_hgrepo='retumilo'


build()
{
    cd "$srcdir/$_hgrepo"
    
    rm -Rf "$srcdir/$_hgrepo-build"
    cp -R . "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"
    
    msg 'Kompilanta...'
    
    ## Generi per qmake:
    
    # Malkomentu la jenan linion por aldoni menubreton.
    #sed -i 's/^\s*#\(\s*DEFINES\s*+=\s*AGORDO_MENUOJ\s*\)$/\1/' retumilo.pro
    
    qmake || return 1
    make || return 1
    make INSTALL_ROOT="$pkgdir/" install
    
    ## Generi per CMake:
    
    # Malkomentu la jenan linion por aldoni menubreton.
    #TRAJTOJ='-D MENUOJ=on'
    
    #cmake $TRAJTOJ . || return 1
    #make || return 1
    #make DESTDIR="$pkgdir/" install
}
