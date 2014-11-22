# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=letsencrypt-preview-git
pkgver=r695.ecff61a
pkgrel=1
pkgdesc="letsencrypt-initiative from EFF, Mozille and others to make certificate setup on apache as easy as can be"
arch=('any')
url="https://letsencrypt.org/"
license=('Apache')
depends=('python' 'python-setuptools' 'python-dev' 'python-augeas' 'gcc' 'swig' 'dialog')
makedepends=('git')
source=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot=https://github.com/letsencrypt/lets-encrypt-preview.git
_gitname=lets-encrypt-preview

pkgver() {
    cd "src/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  #./autogen.sh
  #./configure --prefix=/usr
  #make
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root=${startdir}/pkg/$pkgname
}

# vim:set ts=2 sw=2 et:
