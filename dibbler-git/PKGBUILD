# Maintainer: Alexei Babich	<impatt@mail.ru>

pkgname=dibbler-git
pkgver=20111224
pkgrel=1
pkgdesc="Dibbler, a portable DHCPv6 - git checkout"
arch=('i686' 'x86_64')
url="http://klub.com.pl/dhcpv6/"
license=('GPL')
makedepends=('git gcc binutils gawk grep coreutils')
provides=(dibbler-git)
conflicts=()

_gitroot="git://github.com/tomaszmrugalski/dibbler.git"
_gitname="dibbler"
_cpus=`cat /proc/cpuinfo | grep -c flags`
build() {
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
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
  ./configure --prefix=/usr 
  nice -n 1 make -j ${_cpus} || return 1
  make DESTDIR="${pkgdir}/" install
}
md5sums=()
