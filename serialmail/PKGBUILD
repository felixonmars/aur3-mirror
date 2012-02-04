# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Hybner <dta081@gmail.com>

pkgname=serialmail
pkgver=0.75
pkgrel=1
pkgdesc="serialmail is a collection of tools for passing mail across serial links."
arch=('i686' 'x86_64')
url="http://cr.yp.to/serialmail.html"
license=('unknown')
source=(http://cr.yp.to/software/serialmail-${pkgver}.tar.gz
	http://www.jeenyus.net/linux/software/maildircmd/maildircmd-1.0.patch
	errno.patch
	conf_home.patch)

build() {
  cd ${srcdir}/serialmail-${pkgver}/

  patch -p1 -i ${srcdir}/errno.patch || return 1
  patch -p1 -i ${srcdir}/conf_home.patch || return 1
  patch -p1 -i ${srcdir}/maildircmd-1.0.patch || return 1
  rm maildirqmtp maildirsmtp

  mkdir -p ${pkgdir}/usr/bin/ || return 1

  make || return 1
  for bin in  maildircmd maildirqmtp maildirserial maildirsmtp serialcmd  serialqmtp serialsmtp setlock; do
    cp ${bin} ${pkgdir}/usr/bin/${bin} || return 1
  done
}

md5sums=('e6a3049863ae8577b1780fcd9fbc98a9'
         '1a5fb7cdebdb42a5bd54d0d8734caf8a'
         '06e637b389fb73dfab3bb1380a33b625'
         'f902d2bc40b408b8d3f6674ffb85ebdc')
