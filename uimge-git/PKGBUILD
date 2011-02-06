# Contributor: Apkawa <apkawa@gmail.com>

pkgname=uimge-git
pkgver=20101023
pkgrel=1
pkgdesc="Python picture uploader to different imagehostings"
arch=('i686' 'x86_64')
url="http://code.google.com/p/uimge/"
license=('GPL')
makedepends=('git' 'setuptools')
depends=('python2' 'python-pycurl')
optdepends=('guimge-git: - multiuploading files gui based on gtk')
provides=('uimge' 'uimge-svn' )
conflicts=('uimge' 'uimge-svn')
replaces=('uimge' 'uimge-svn')

_gitname="uimge"
_gitroot="git://github.com/Apkawa/uimge.git"
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

  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build/
  python2 setup.py build -f install -f --root ${pkgdir} --prefix=/usr || return 1
}
