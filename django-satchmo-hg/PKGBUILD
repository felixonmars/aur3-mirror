# Contributor: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=django-satchmo-hg
pkgver=2077
pkgrel=1
pkgdesc="Online shop in Django"
arch=(any)
url="http://satchmoproject.com/"
license=('BSD')
depends=('python2' 'python-imaging' 'django' 'python-sphinx' 'docutils' 'pycrypto' 'python-south' 'python-yaml' 'django-registration' 'django-threaded-multihost' 'django-app-plugins' 'sorl-thumbnail' 'django-signals-ahoy' 'django-livesettings-hg' 'django-keyedcache-hg')
source=()
md5sums=()

_hgroot='http://bitbucket.org/chris1610'
_hgrepo='satchmo'

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

    msg 's/python/python2/g'
    find . -name '*.py' | xargs sed -i s/python/python2/g

    msg 'Running setup.py'
    
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --optimize=1 || return 1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

