#Maintainer: Aeternus Atterratio <atterratio@gmail.com>

pkgname=django-cms-gallery-git
pkgver=20121021
pkgrel=1
pkgdesc="Simple photo gallery plugin for DjangoCMS"
arch=('any')
license=('custom')
url="https://github.com/centralniak/cmsplugin_gallery"
depends=('python2' 'django' 'django-inline-ordering-git' 'django-easy-thumbnails-git')
makedepends=('git' 'python2-distribute')

_gitroot="https://github.com/centralniak/cmsplugin_gallery.git"
_gitname="django-cms-gallery"

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
