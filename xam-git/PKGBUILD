# Maintainer: archtux <antonio dot arias99999 at gmail.com>

pkgname=xam-git
pkgver=20120423
pkgrel=1
pkgdesc="A CLI utility for searching and listing XBMC Addon Repositories."
url="https://github.com/jbeluch/xam/"
arch=('any')
license=('custom')
depends=('python2' 'python2-certifi' 'python2-chardet' 'python2-requests')
makedepends=('git')

_gitroot="https://github.com/jbeluch/xam.git"
_gitname="xam"


build() {
   cd $srcdir
   msg "Connecting to GIT server...."

   if [ -d $srcdir/$_gitname ] ; then
  	cd $_gitname && git pull origin
  	msg "The local files are updated."
   else
  	git clone $_gitroot
   fi

   msg "GIT checkout done or server timeout"
   msg "Starting make..."

   cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build

   cd ./${_gitname}-build

   # Build
   python2 setup.py install --root $pkgdir --optimize=1

   # License
   install -Dm644 LICENSE $pkgdir/usr/share/licenses/xam/LICENSE
}