# Contributor: Apkawa <apkawa@gmail.com>

pkgname=quimge-git
pkgver=20110125
pkgrel=1
pkgdesc="PyQt GUI for uimge - picture uploader to different imagehostings"
arch=('any')
url="http://code.google.com/p/quimge/"
license=('GPL')
makedepends=('git')
depends=('python2' 'uimge-git' 'python2-qt' 'qt')

_gitname="quimge"
_gitroot="git://github.com/Apkawa/quimge.git"
build() {
  cd ${srcdir}
  msg "Connecting to $_gitroot GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/${_gitname}
  python2 setup.py build -f install -f --root $startdir/pkg --prefix=/usr || return 1

}
