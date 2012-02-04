# Maintainer: kachelaqa <kachelaqa at gmail dot com>
# Contributor: Jesse Young <jesse.young@gmail.com>

pkgname='mercurial-histedit-hg'
pkgver=55
pkgrel=2
pkgdesc='History editing plugin for Mercurial, heavily inspired by git rebase --interactive.'
arch=('any')
url='http://bitbucket.org/durin42/histedit/overview'
license=('GPL')
depends=('mercurial' 'python2')

_hgroot='http://bitbucket.org/durin42'
_hgrepo='histedit'

build() {
    cd "$srcdir"
    msg 'Connecting to Mercurial server....'
    
    if [ -d "$_hgrepo" ] ; then
        cd "$_hgrepo"
        hg pull -u || return 1
        msg 'The local files are updated.'
    else
        hg clone "$_hgroot" "$_hgrepo" || return 1
    fi
    
    msg 'Mercurial checkout done or server timeout'
    msg 'Starting make...'
    
    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"
    
    python2 setup.py install --root="$pkgdir" || return 1
} 
