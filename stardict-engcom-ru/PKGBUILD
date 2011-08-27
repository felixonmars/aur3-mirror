# Maintainer: AdUser <alexey_z@list.ru>
pkgname=stardict-engcom-ru
fake_pkgname=engcom
pkgver=1.35
pkgrel=2
pkgdesc="Open English-Russian dictionary of computer terms"
arch=('i686' 'x86_64')
url="http://engcom.org.ru"
license=('GPL')
depends=('stardict')
makedepends=('makedict' 'python2' 'dictd')
source=(http://etersoft.ru/download/engcom/$fake_pkgname-$pkgver.tar.bz2)
md5sums=('2ae0577023810e737271c765a5552afb')

path="/usr/share/stardict/dic/"
magic="stardict-$pkgname-2.4.2" # ^_^

build()
{
  cd "$srcdir/$fake_pkgname-$pkgver/dict"
  mkdir -p temp

  make
  mv EngCom.koi $pkgname.koi
  python2 engcom_parser.py $pkgname.koi    > $pkgname.tmp
  grep -v "<meta_info>" $pkgname.tmp > $pkgname
  makedict -i xdxf -o stardict $pkgname -d temp
  dictzip temp/$magic/$pkgname.dict
}

package()
{
  cd "$srcdir/$fake_pkgname-$pkgver/dict"
  for i in dict.dz idx ifo; do
    install -p -m644 -D temp/$magic/$pkgname.$i $pkgdir/$path/$pkgname.$i
  done
}

# vim:set ts=2 sw=2 et:

