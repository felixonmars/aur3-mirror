pkgname=csvdict
pkgver=0.1

pkgrel=3

pkgdesc="A dictionary application that uses CSV"

url="https://github.com/ekd123/csvdict"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glib2>=2.26')


source=(https://github.com/ekd123/csvdict/zipball/0.1)
md5sums=('9bc7fbeb1dde98796363cddfafa8c7ff')

build(){
  cd $startdir/src/ekd123-csvdict-*
  ./configure --prefix=/usr || return 1
  make
}

install()
{
  make install
}

uninstall()
{
  make uninstall
}
