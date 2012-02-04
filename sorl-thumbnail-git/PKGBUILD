#Contributor: Melvin Laplanche <melvin.laplanche at gmail dot com>
pkgname=sorl-thumbnail-git
pkgver=20110813
pkgrel=1
pkgdesc='Thumbnailer library, mainly for Django.'
arch=('any')
url='https://github.com/sorl/sorl-thumbnail'
license=('custom')
depends=('python' 'django')
makedepends=('git')
optdepends=('imagemagick' 'wv2')
provides=('sorl-thumbnail')
md5sums=()

_gitroot="https://github.com/sorl/sorl-thumbnail.git"
_gitname="sorl-thumbnail"

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
