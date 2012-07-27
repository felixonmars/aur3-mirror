pkgname=django-ckeditor-git
pkgver=20120727
pkgrel=1
pkgdesc="CKEditor widget for Django."
arch=(any)
url="https://github.com/dwaiter/django-ckeditor"
license=('BSD')
depends=('python2')
makedepends=('git')
provides=('django-ckeditor')
md5sums=()

_gitroot="https://github.com/dwaiter/django-ckeditor.git" 
_gitname="django-ckeditor"

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
  install -Dm644 LICENSE.markdown "${pkgdir}/usr/share/licenses/${_gitname}/COPYING"
}

