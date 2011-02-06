#Contributor: Bruno Galeotti <bravox87 at gmail.com>
pkgname=django-annoying-hg
pkgver=27
pkgrel=1
pkgdesc='Django application that try to eliminate annoying things in Django framework'
arch=(i686 x86_64)
url='http://bitbucket.org/offline/django-annoying/'
license=('custom')
makedepends=('mercurial')
provides=('django-annoying')
md5sums=()

_hgroot='http://bitbucket.org/offline/'
_hgrepo='django-annoying'

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
  python2 setup.py install --root=$pkgdir || return 1
}

