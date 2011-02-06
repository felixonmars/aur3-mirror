# Contributor: noonov <noonov@gmail.com>

pkgname=mfiler2
pkgver=4.1.0
pkgrel=1
pkgdesc="A ncurses based file manager with Ruby interpreter"
arch=('i686' 'x86_64')
url="http://www.geocities.jp/daisuke530221jp/"
license=('GPL2')
depends=('ncurses' 'gcc-libs' 'oniguruma' 'ruby1.8')
source=(http://www.geocities.jp/daisuke530221jp/${pkgname}-${pkgver}.tgz
        ruby18.patch)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -Np1 -i ${srcdir}/ruby18.patch || return 1

  ./configure --prefix=/usr --sysconfdir=/etc/mfiler2 || return 1
  make || return 1
  make -j1 prefix=${pkgdir}/usr sysconfdir=${pkgdir}/etc/mfiler2 install || return 1

  for _file in ${pkgdir}/usr/bin/m*[^2]; do
    mv ${_file} ${_file}2
  done

  rm -rf ${pkgdir}/usr/share/mfiler
}

md5sums=('5d5d6eb4108292b6d323b39cf14aa271'
         'df0ff77aa0f764fc6fd7cd1b890e26e2')
