#Maintainer: Aeternus Atterratio <atterratio@gmail.com>

pkgname=django-cms-git-dep
pkgver=20121021
pkgrel=1
pkgdesc="CMS framework based on Django - GIT Version with all dependencies"
arch=('any')
url="http://www.django-cms.org/"
license=('GPL')
depends=('python2' 'django' 'python2-south' 'python2-imaging' 'python2-pip' 'django-mptt-git' 'django-sekizai-git'  'django-classy-tags')
makedepends=('git')
provides=('django-cms' 'django-cms-git')
conflicts=('django-cms' 'django-cms-git')
replaces=('django-cms' 'django-cms-git')

_gitroot="https://github.com/divio/django-cms.git"
_gitname="django-cms"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

}

package() {
	cd $srcdir/$_gitname
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --install-data=/usr/share/$pkgname || return 1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE  
  
} 
