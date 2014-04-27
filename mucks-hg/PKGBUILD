# Maintainer: Daniel Naegele <danieln@selfnet.de>
name=mucks
pkgname=mucks-hg
pkgver=1.0
pkgrel=1
pkgdesc="Mucks, a session manager for tmux and screen."
url="http://zserge.com/blog/mucks.html"
arch=('any')
license=('?')
depends=('sed')
optdepends=('tmux' 'screen')
makedepends=('mercurial')
_hgroot='https://bitbucket.org/zserge'
_hgrepo=$name

package() {
    cd $startdir/src

    if [ -d $_hgrepo ]; then
        cd $_hgrepo
        hg pull -u
    else
        hg clone ${_hgroot}/${_hgrepo}
        cd $_hgrepo
    fi

    mkdir -p $pkgdir/usr/bin
    cp mucks $pkgdir/usr/bin/mucks
}
