# Contributor: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=django-livesettings-hg
pkgver=23
pkgrel=1
pkgdesc="Configure settings.py through Django admin interface."
arch=(any)
url="http://bitbucket.org/bkroeze/django-livesettings"
license=('BSD')
depends=('django')
provides=('django-livesettings')
conflicts=('django-livesettings')
source=()
md5sums=()

_hgroot='http://bitbucket.org/bkroeze'
_hgrepo='django-livesettings'

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

    #msg 's/python/python2/g'
    #find . -name '*.py' | xargs sed -i s/python/python2/g

    msg 'Running setup.py'
    
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --optimize=1 || return 1
    rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests
}

