# Contributor: Sylvain HENRY <hsyl20@gmail.com>

pkgname=starpu-nightly
pkgver=$(date +%Y%m%d)
pkgrel=1
pkgdesc="StarPU Runtime System"
arch=('i686' 'x86_64')
url="http://runtime.bordeaux.inria.fr/StarPU/"
license=('LGPL')
makedepends=('make' 'gcc' 'hwloc' 'wget')
conflicts=('starpu')

build() {
  cd ${srcdir}

  fname=starpu-nightly-latest.tar.gz
  uri="http://starpu.gforge.inria.fr/testing/$fname"

  msg "Downloading..."
  if [ -e /usr/bin/aria2c ]
  then
    aria2c $uri || return 1
  else
    wget $uri || return 1
  fi

  msg "Extracting..."
  bsdtar -x -f $fname || return 1

  msg "Packaging..."
  cd starpu-[0-9]*.[0-9]*.[0-9]*
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install

}
