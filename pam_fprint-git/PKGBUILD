# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: Ondřej Konečný <konecny.ondrej@seznam.cz>

pkgname=pam_fprint-git
pkgver=20100509
pkgrel=1
pkgdesc="Git repo of libfprint"
url="http://reactivated.net/fprint/wiki/Pam_fprint"
arch=('i686' 'x86_64')
license=('LGPL')
groups=('fprint')
depends=('libusb1' 'imagemagick' 'libtool')
conflicts=('pam_frint' 'pam_frint-nightly' 'pam_fprint-unstable')
provides=('pam_frint' 'pam_frint-nightly' 'pam_fprint-unstable')
makedepends=('git')

_gitroot="git://github.com/dsd/pam_fprint.git"
_gitname="pam_fprint"

build() {
  cd ${srcdir}
  msg "Connecting to github.com GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build
  
  ./autogen.sh --prefix=/usr

  ./configure --prefix=/usr

  make || return 1
  make DESTDIR="$pkgdir" install
}
