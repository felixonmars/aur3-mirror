#Maintainer: Aeternus Atterratio <atterratio@gmail.com>

pkgname=django-easy-thumbnails-git
pkgver=20121021
pkgrel=2
pkgdesc="Easy thumbnails for Django"
arch=('any')
url="https://github.com/SmileyChris/easy-thumbnails"
license=('custom')
depends=('python2' 'django')
makedepends=('git' 'python2-distribute')

_gitroot="https://github.com/SmileyChris/easy-thumbnails.git"
_gitname="django-easy-thumbnails"

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

}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
