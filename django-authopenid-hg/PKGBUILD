pkgname=django-authopenid-hg
pkgver=168
pkgrel=1
pkgdesc="authenticate your users with OpenID in Django apps"
arch=(any)
url="http://bitbucket.org/benoitc/django-authopenid"
license=('Apache License 2')
depends=('django')
source=()
md5sums=()

_hgroot='https://bitbucket.org/benoitc'
_hgrepo='django-authopenid'

build() { 
    cd $srcdir

    if [ -d $_hgrepo/.hg ]; then
        (cd $_hgrepo && hg up -r $pkgver)
    else
        hg clone -r $pkgver $_hgroot/$_hgrepo $_hgrepo
    fi

    msg 'Mercurial checkout done or server timeout'

    if [ -d $_hgrepo-build ]; then
        msg 'Removing old build directory'
        rm -rf $_hgrepo-build
    fi
    
    msg 'Copying repository to another build directory'
    cp -r $srcdir/$_hgrepo $srcdir/$_hgrepo-build
    
    msg 'Starting build'
    cd $srcdir/$_hgrepo-build

    msg 'Running setup.py'
    
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --optimize=1 || return 1
    rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests   
}
