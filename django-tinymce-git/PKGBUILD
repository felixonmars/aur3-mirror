pkgname=django-tinymce-git
pkgver=20120727
pkgrel=1
pkgdesc="TinyMCE widget for Django."
arch=(any)
url="https://github.com/aljosa/django-tinymce"
license=('MIT')
depends=('python2')
makedepends=('git')
provides=('django-tinymce')
md5sums=()

_gitroot="https://github.com/aljosa/django-tinymce.git" 
_gitname="django-tinymce"

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
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_gitname}/COPYING"
}

