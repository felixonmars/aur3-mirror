# Maintainer: Robert Orzanna <orschiro@gmail.com>
# modified by workdowg 05/06/2014
 
_gitname=tasky
pkgname=${_gitname}-git
pkgver=27
pkgrel=3
pkgdesc="A command-line desktop client for Google Tasks."
arch=('any')
url="https://github.com/jrupac/tasky"
license=('GPL')
depends=('python2>=2.7' 'python2-google-api-python-client')
makedepends=('git')
provides=("$_gitname")
source=('git://github.com/jrupac/tasky.git')
md5sums=('SKIP')
 
install=tasky.install
 
pkgver() {
        cd "$srcdir/$_gitname"
        # Use the tag of the last commit
        local ver="$(git describe --long)"
        printf "%s" "${ver//-/.}"
}
 
prepare() {
        cd "$srcdir/"          
        # Fixing shebang to python2
        sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" "${_gitname}/tasky.py"
}
 
package() {
        cd "$srcdir/$_gitname"
       
        # copying binaries and libaries
        install -D -m755 "tasky.py" "${pkgdir}/usr/bin/${_gitname}"
 
        # copying readme information
        install -D -m644 "README.md" "${pkgdir}/usr/share/doc/${_gitname}/README"
}
 
# vim:set ts=2 sw=2 et: