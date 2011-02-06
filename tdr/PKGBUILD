# Contributor: Fabian Streitel <karottenreibe@gmail.com>

pkgname=tdr
pkgver=20090604
pkgrel=1
pkgdesc="tdr - Todo Done Right. Simple todo tool with both console and GUI interface"
url="http://wiki.github.com/karottenreibe/tdr"
arch=('i686' 'x86_64')
license=("DON'T PANIC License 1.1")
depends=('ruby' 'rubygems')
provides=('tdr')
conflicts=()
backup=()
makedepends=('git' 'rake')
install=()
source=()
md5sums=()
_gitroot="git://github.com/karottenreibe/tdr.git"
_gitname="tdr"


build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  msg "Installing gem dependency..."
  gem install pablo -i ${startdir}/pkg`gem environment gemdir` || return 1

  msg "Starting make..."

  git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build -n -q
  cd ${srcdir}/$_gitname-build/

  git checkout stable -q
  rake pack ruby || return 1

  mkdir -p ${startdir}/pkg/usr/bin
  install -m755 tdr ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/java/tdr
  install -m644 tdr.jar ${startdir}/pkg/usr/share/java/tdr

  rm -r ${srcdir}/$_gitname-build
}
# vim:syntax=sh

