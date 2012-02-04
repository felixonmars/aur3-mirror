# Maintainer: Dennis Felsing <defelsing+aur@gmail.com>

pkgname=rdictcc
pkgver=7.1.1
pkgrel=1
pkgdesc="A dictionary / word translator written in Ruby. It uses the dictionaries you can fetch from http://www.dict.cc. RDictCc has a tight integration into Emacs."
arch=('any')
url="http://www.tsdh.de/cgi-bin/wiki.pl/RDictCc"
license=('GPL3')
depends=('ruby' 'gdbm')
install=rdictcc.install
source=(http://www.tsdh.de/apps/$pkgname-$pkgver.tar.bz2)

md5sums=('0bc4918d46b4ddab58ac1f3925846601')

build() {
  cd "${srcdir}/${pkgname}"
  sed -i "s#-<>]/, ' ').strip.split do |w|#<>-]/, ' ').strip.split do#" rdictcc.rb
  sed -i 's#rdictcc.rb#rdictcc#g' rdictcc.rb
  sed -i 's#/usr/local/bin/rdictcc.rb#/usr/bin/rdictcc#' rdictcc.el
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 rdictcc.rb "$pkgdir/usr/bin/rdictcc"
  install -Dm644 rdictcc.el "$pkgdir/usr/share/emacs/site-lisp/rdictcc.el"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
