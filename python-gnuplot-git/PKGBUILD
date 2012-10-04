# Maintainer: Yichao Yu <yyc1992@gmail.com>
# Contributor : Yichao Yu <yyc1992@gmail.com>
pkgname=python-gnuplot-git
pkgver=20121004
pkgrel=1
pkgdesc="A python3 port of Gnuplot.py, a Python interface to gnuplot."
arch=('any')
url="https://github.com/yuyichao/gnuplot-py"
license=('LGPL')
depends=('python-numpy' 'gnuplot')
makedepends=('git')
#options=(!emptydirs)

_gitroot='https://github.com/yuyichao/gnuplot-py.git'
_gitname='gnuplot-py'

build() {
  cd "$srcdir"
  msg "Connecting to github.com"

  if [ -d "$_gitname" ] ;then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"

  git checkout master
}


package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
