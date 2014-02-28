# Maintainer: sms <sms@i-mentor.pl>
# Author: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libesmtp-linknx
pkgname_=libesmtp
provides=('libesmtp')
conflicts=('libesmtp')
pkgver=1.0.4
pkgrel=1
pkgdesc='old version of libesmtp, for use with linknx.'
arch=('i686' 'x86_64')
url='http://www.stafford.uklinux.net/libesmtp/'
license=('LGPL')
depends=('openssl')
source=("${pkgname_}-${pkgver}.tar.bz2")
md5sums=('8b4e8a794adc46268f0c6a0b3fb79486')

build() {
  cd "${srcdir}/${pkgname_}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname_}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

