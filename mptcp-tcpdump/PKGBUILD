# Maintainer: Jon Gjengset <jon@tsp.io>

pkgname=mptcp-tcpdump
pkgver=0.87.571bf53
pkgrel=1
pkgdesc="MPTCP enabled tool for network monitoring and data acquisition"
arch=('i686' 'x86_64')
url="http://www.tcpdump.org"
conflicts=('tcpdump')
provides=('tcpdump=4.5.0-PRE-GIT_2013_07_27')
license=('BSD')
depends=('libpcap' 'openssl')
source=("git://github.com/multipath-tcp/tcpdump.git#branch=mptcp_v0.87"
        'tcpdump_duplicate_executable.patch')
md5sums=('SKIP'
         '01379e4a12a208ce951c6c2abe80300f')

pkgver() {
  cd ${srcdir}/${pkgname#mptcp-}
  echo 0.87.$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname#mptcp-}"

  # do not install tcpdump-4.1.1 executable (FS#23346)
  patch -Np1 -i "${srcdir}/tcpdump_duplicate_executable.patch"

  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --enable-ipv6
  make
}

package() {
  cd "${srcdir}/${pkgname#mptcp-}"

  make DESTDIR="${pkgdir}" install

  #install the license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
