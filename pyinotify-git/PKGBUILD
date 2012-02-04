# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=pyinotify-git
pkgver=20101110
pkgrel=1
pkgdesc="Python bindings for inotify - git version"
arch=('any')
url="http://trac.dbzteam.org/pyinotify"
license=('GPL')
depends=('kernel26>=2.6.13' 'python')
provides=('pyinotify')
conflicts=('pyinotify')
replaces=('pyinotify')

_gitroot="https://github.com/seb-m/pyinotify.git"
_gitname="pyinotify"

build() {
  msg "Connecting to gitorious.org GIT server...."

if [ -d $srcdir/$_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
else
   git clone $_gitroot
fi

msg "GIT checkout done or server timeout"
msg "Starting make..."

rm -rf ${srcdir}/${_gitname}-build
cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

  cd $srcdir/$_gitname-build
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
