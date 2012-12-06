# Maintainer: Vlatko Kosturjak <kost@linux.hr>
# Based on PKGBUILD from: Hugo Doria <ly50247@gmail.com>

pkgname=nmap-dev
pkgver=6.25
pkgrel=1
pkgdesc="A network exploration tool and security/port scanner, development version"
_realname=nmap
arch=('i686' 'x86_64')
url="http://nmap.org"
license=('GPL')
depends=('pcre' 'openssl' 'libpcap>=1.0.0' 'lua')
options=('!makeflags')
provides=('nmap')
conflicts=('nmap')
source=(http://nmap.org/dist/${_realname}-${pkgver}.tar.bz2)

build() {
  cd ${srcdir}/${_realname}-${pkgver}

  ./configure --prefix=/usr --mandir=/usr/share/man \
    --libexecdir=/usr/lib --with-openssl=/usr/include/openssl --with-libpcap=/usr/include/pcap PYTHON=python2
  make || return 1
  make DESTDIR="${pkgdir}" install

  # install GPL2 license
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${_realname}/LICENSE
}
md5sums=('fcc80f94ff3adcb11eedf91092ea6f5e')
