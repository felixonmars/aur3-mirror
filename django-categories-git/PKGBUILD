# Maintainer: Laplanche Melvin <melvin.laplanche at gmail dot com>

pkgname=django-categories-git
pkgver=20110807
pkgrel=1
pkgdesc="This app attempts to provide a generic category system that multiple apps could use. It uses MPTT for the tree storage and provides a custom admin for better visualization (copied and modified from feinCMS)"
arch=('any')
url="https://github.com/callowayproject/django-categories"
license=('APACHE')
depends=('django' 'django-mptt')
makedepends=('git')
conflicts=('')
md5sums=()

_gitroot="https://github.com/callowayproject/django-categories.git"
_gitname="django-categories"

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
