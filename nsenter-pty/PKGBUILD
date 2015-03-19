pkgname=nsenter-pty
pkgver=0.0.1
pkgrel=1
pkgdesc='Nsenter with pseudo tty support'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/Mic92/nsenter-pty'
makedepends=('autoconf' 'automake' 'git')
source=(git+https://github.com/Mic92/nsenter-pty)
md5sums=('SKIP')

prepare() {
  cd nsenter-pty

  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd nsenter-pty

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd nsenter-pty
  make DESTDIR="${pkgdir}" install
}
