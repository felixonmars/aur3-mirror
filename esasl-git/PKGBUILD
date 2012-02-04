# Contributor: Gunnar Kriik <gunnar.kriik@gmail.com>

pkgname='esasl-git'
pkgver='20110419'
pkgrel='1'
pkgdesc='SASL library for Erlang'
arch=('i686' 'x86_64')
url='https://github.com/mikma/esasl/'
license=('GPL')
depends=('erlang' 'gsasl')

_gitroot="git://github.com/mikma/esasl.git"
_gitname="esasl"

build() {
  cd "${srcdir}"

  msg 'Updating source from GIT server...'
  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "$srcdir/$_gitname"{,-build}
  cd "${srcdir}/${_gitname}-build"

  ./bootstrap; ./configure --prefix=/usr
  make; make DESTDIR=$pkgdir install
} 
