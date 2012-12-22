# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=jieba
pkgname=python3-$_pkgname-git
pkgver=20121222
pkgrel=1
pkgdesc="JieBa Chinese Words Segment Library based on HMM model for Python"
arch=('any')
url=('https://github.com/fxsjy/jieba')
license=("MIT")
depends=('python3')

_gitroot="git://github.com/fxsjy/jieba.git"
_gitname=$_pkgname

build() {
  cd "$srcdir"
  msg "Connecting to github.com GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi
  
  git checkout jieba3k

  msg "GIT checkout done or server timeout"

}

package() {
  cd "$srcdir/$_gitname"
  python3 setup.py install --root="$pkgdir"
}
