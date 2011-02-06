# Contributor: apkawa <apkawa@gmail.com>
pkgname=django-cpserver-git
pkgver=20101122
pkgrel=1
pkgdesc="Management commands for serving Django via CherryPy's built-in WSGI server "
arch=('any')
url="https://github.com/lincolnloop/django-cpserver"
license=('GPL')
groups=()
depends=('python2' 'django' 'cherrypy')
makedepends=('git')

_gitroot="https://github.com/lincolnloop/django-cpserver.git"
_gitname="${pkgname}"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
    cd ${srcdir}/${_gitname}
    python2 setup.py install --root=$pkgdir && \
    install -D -m0644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE

} 
