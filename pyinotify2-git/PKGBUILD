# Maintainer: M Rawash <mrawash@gmail.com>
# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=pyinotify2-git
pkgver=20101110
pkgrel=2
pkgdesc="Python2 bindings for inotify - git version"
arch=('any')
url="http://trac.dbzteam.org/pyinotify"
license=('GPL')
depends=('kernel26>=2.6.13' 'python2')
provides=('pyinotify2')
conflicts=('pyinotify2')
replaces=('pyinotify2')

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
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
