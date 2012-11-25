# Maintainer: Kerrick Staley <mail@kerrickstaley.com>

pkgname=pyzy-git
pkgver=20121030
pkgrel=1
pkgdesc='\
The Chinese PinYin and Bopomofo conversion library.'
arch=('i686' 'x86_64')
url='https://github.com/pyzy/pyzy'
license=('LGPL')
depends=()
makedepends=('git')
optdepends=()
provides=('pyzy')
conflicts=('pyzy')

build() {
  if [ -d pyzy ]; then
    cd pyzy && git clean -fd && git pull origin master
  else
    git clone 'git://github.com/pyzy/pyzy.git' && cd pyzy
  fi
  
  # replace python with python2; see https://github.com/hsumita/libpyzy/issues/1
  find . -name '*.py' -exec sed -ri '1s#(bin/|env )python#\1python2#' '{}' \;
  
  ./autogen.sh
  make
}

package() {
  cd pyzy

  make DESTDIR="$pkgdir" install
  install -D pyzy-1.0.pc "$pkgdir"/usr/lib/pkgconfig/pyzy-1.0.pc
}
