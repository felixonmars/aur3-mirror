# Maintainer : Tianjiao Yin <ytj000@gmail.com>

_pkg=google-styleguide-zh-cn
pkgname=$_pkg-git
pkgver=20120920
pkgrel=1
pkgdesc="Style guides for Google-originated open-source projects, Chinese (language) version."
arch=('any')
url="http://zh-google-styleguide.readthedocs.org/"
license=('GPL')
makedepends=('git' 'python-sphinx')
provides=("$_pkg")
conflicts=("$_pkg")

_gitroot="git://github.com/brantyoung/zh-google-styleguide.git"
_gitname="$_pkg"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --depth=1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  make -C ${srcdir}/$_gitname/ html

}

package() {
    _insdir="${pkgdir}/usr/share/doc/google-styleguide/zh"
    mkdir -p $_insdir
    mv ${srcdir}/$_gitname/_build/html $_insdir
    true
}
