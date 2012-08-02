# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: sbillaudelle <stein@cream-project.org>

pkgname=fapws3-git
pkgver=20120802
pkgrel=1
pkgdesc="Fast Asynchronous Python Web Server (based on libev)."
url="http://github.com/william-os4y/fapws3"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libev')
conflicts=('fapws2' 'fapws1')
source=()
md5sums=()

_gitname=fapws3
_gitroot="git://github.com/william-os4y/fapws3.git"

build()
{
  cd "${srcdir}"
  msg "Connecting to GIT server...."
  if [ -d ${_gitname} ] ; then
     cd ${_gitname} && git pull origin
     msg "The local files are updated."
  else
     git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  mkdir "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	
  cd "$srcdir/${_gitname}-build"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
