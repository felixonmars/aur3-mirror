#Contributor: Bruno Galeotti <bravox87 at gmail.com>
pkgname=django-media-bundler-git
pkgver=20091023
pkgrel=1
pkgdesc='Django application that bundles your Javascript and CSS and sprites your icons.'
url='http://github.com/rnk/django-media-bundler'
license='custom'
arch=('i686' 'x86_64')
depends=()
makedepends=('git')
conflicts=('django-media-bundler' 'django-media-bundler-hg')
replaces=('django-media-bundler' 'django-media-bundler-hg')
provides=('django-media-bundler')
_gitroot='git://github.com/rnk/django-media-bundler.git'
_gitname='django-media-bundler'
source=()
md5sums=()

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"

  if [ -d $_gitname-build ]; then
    msg 'Removing old build directory'
    rm -rf $_gitname-build
  fi

  msg 'Copying repository to another build directory'
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  
  msg "Starting build"
  cd $srcdir/$_gitname-build
  
  msg 'Running setup.py'
  python setup.py build || return 1
  python setup.py install --root=$pkgdir || return 1
}