# Maintainer: CHEN Xing <cxcxcxcx@gmail.com>

pkgname=w-app-git
pkgver=20121118
pkgrel=1
pkgdesc="Turn a web app into a real desktop application"
arch=('any')
url="http://code.google.com/p/w-app/"
license=('BSD')
depends=('python2-pyqt' 'python2-distribute' 'python2-keybinder2' 'python2-notify' 'pywebkitgtk' 'python2-beautifulsoup3')
provides=('w-app')
conflicts=('w-app')
_gitroot="https://code.google.com/p/w-app/"
_gitname="w-app"

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
  
  cd "$srcdir/$_gitname"
  
  msg ""

  msg "Starting make..."

  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
