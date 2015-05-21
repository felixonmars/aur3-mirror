# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
pkgname=mosh-multipath-git
pkgver=20150311
pkgrel=2
pkgdesc="Mobile shell, surviving disconnects with local echo and line editing (multipath version)"
arch=('i686' 'x86_64' 'arm')
url="http://mosh.mit.edu/"
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty'
         'perl-io-socket-inet6' 'libutempter')
makedepends=('git')
optdepends=('vte-mosh-fix: to work properly in vte'
            'vte3-mosh-fix: to work properly in vte3')
conflicts=('mosh' 'mosh-git')
source=('git+https://github.com/boutier/mosh.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/mosh"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}/mosh"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/mosh"
  make DESTDIR="${pkgdir}" install
  rmdir "${pkgdir}/usr/etc"
}
