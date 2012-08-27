# Contributor: Hiroshi Yui (hiroshiyui@gmail.com)

pkgname=ibus-array-git
pkgver=16
pkgrel=6
pkgdesc='Array 30 Input Method for iBus'
arch=('i686' 'x86_64')
url="https://github.com/lexical/ibus-array"
license=('GPLv2')
depends=('ibus>=1.4.0' 'python2' 'sqlite3')
makedepends=('automake')

build() {
  cd ${srcdir}
 
  if [ -e ${pkgname} ]; then
    cd ${pkgname}
    git pull
  else
    git clone git://github.com/hiroshiyui/ibus-array.git ${pkgname}
    cd ${pkgname}
  fi

  export PYTHON='/usr/bin/python2'
  aclocal
  automake --add-missing
	./configure  --prefix=/usr LIBS="-ldl"
	make || return 1
	make DESTDIR=$pkgdir install
}
