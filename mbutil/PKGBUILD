# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
pkgname=mbutil
pkgver=20130320
pkgrel=1
pkgdesc='MBUtil is a utility for importing and exporting the MBTiles format, typically created with MapBox TileMill.'
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2')
url='https://github.com/mapbox/mbutil'

_gitroot='https://github.com/mapbox/mbutil.git'
_gitname='mbutil'

build() {
    cd "$srcdir"
    
    msg 'Connecting to GIT server...'
    if [[ -d "$_gitname" ]]; then
        (cd "$_gitname"; git pull origin) || return 1
    else
        git clone --depth=1 "$_gitroot" "$_gitname" || return 1
    fi
    msg 'GIT checkout done'
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
