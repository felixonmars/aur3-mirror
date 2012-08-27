pkgname=django-rest-framework-git
pkgver=20120827
pkgrel=3
pkgdesc="Django REST framework is a lightweight REST framework for Django, that aims to make it easy to build well-connected, self-describing RESTful Web APIs."
arch=(any)
url="http://django-rest-framework.org/"
license=('BSD')
depends=('python2' 'django' 'python2-urlobject')
makedepends=('git')
optdepends=('python2-markdown: Markdown support' 'python2-yaml: YAML support ')
conflicts=('django-rest-framework')
provides=('django-rest-framework')
md5sums=()

_gitroot="https://github.com/tomchristie/django-rest-framework.git" 
_gitname="django-rest-framework"

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

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/COPYING"
}

