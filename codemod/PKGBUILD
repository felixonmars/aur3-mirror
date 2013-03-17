# Maintainer: Wai Hon Law <whhone@gmail.com>
pkgname=codemod
pkgver=20130317
pkgrel=2
pkgdesc="codemod.py is a tool/library to assist you with large-scale codebase refactors that can be partially automated but still require human oversight and occassional intervention. Codemod was developed at Facebook and released as open source."
arch=('any')
url="https://github.com/facebook/codemod"
license=('Apache')
depends=('python2')
makedepends=('git')

_gitroot='https://github.com/whhone/codemod.git'
_gitname='codemod'

build() {
    cd "$srcdir"
  
    msg "Connecting to github GIT server...."
    
    if [ -d "$srcdir/$_gitname" ] ; then
        cd $_gitname && git pull origin
    else
        git clone "$_gitroot"
        cd $_gitname
    fi
		mkdir -p "$pkgdir/usr/bin/"
    install -m 755 src/codemod.py "$pkgdir/usr/bin/codemod.py"
}

