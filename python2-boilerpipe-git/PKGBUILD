# Maintainer: Tom Vincent <http://tlvince.com/contact/>
_pkgname=python2-boilerpipe
pkgname=$_pkgname-git
pkgver=20120831
pkgrel=1
pkgdesc="Python interface to Boilerpipe"
arch=(any)
url="https://github.com/misja/python-boilerpipe"
license=('GPL')
depends=('python2' 'jpype' 'python2-chardet')
makedepends=('git')
options=(!emptydirs)

_gitroot=https://github.com/misja/python-boilerpipe.git
_gitname=$_pkgname

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
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
