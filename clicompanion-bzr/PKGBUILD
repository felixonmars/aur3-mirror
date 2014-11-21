# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=clicompanion-bzr
pkgver=1.1+r112
pkgrel=1
pkgdesc="Run terminal commands from a GUI storing commands for later use CLI Companion is an application that is used as a complement to the Terminal."
arch=('any')
url="https://launchpad.net/clicompanion"
depends=('python2' 'most' 'pygtk' 'vte')
# makedepends=('python2-distribute')
license=('GPL v3')
# conflicts=('clicompanion')
# provides=('clicompanion')
source=("$pkgname"::'bzr+http://bazaar.launchpad.net/~clicompanion-devs/clicompanion/trunk')
md5sums=('SKIP')

#_bzrtrunk=clicompanion
#_bzrmod=clicompanion

pkgver() {

    cd $pkgname
    # bzr revno
    printf "1.1+r%s" "$(bzr revno)"
    
}

build() {
  
    cd "$srcdir/$pkgname"
    
    msg2 "  -> Build program ..."
    python2 setup.py build
    
}

package() {
   
    cd "$srcdir/$pkgname"

    msg2 "  -> Installing program, icons and .desktop file ..."
    python2 setup.py install --root=$pkgdir --optimize=1

}

# vim:set ts=2 sw=2 et: