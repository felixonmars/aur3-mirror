# Maintainer: TDY <tdy@gmx.com>

pkgname=spiderfetch
pkgver=0.4.3
pkgrel=1
pkgdesc="A robust, modular web spider suite driven by regex recipes"
arch=('i686' 'x86_64')
url="http://www.matusiak.eu/numerodix/code.php"
license=('GPL3')
depends=('python')
#makedepends=('wget')
source=($pkgname-$pkgver.tar.gz::http://github.com/numerodix/$pkgname/tarball/$pkgver
        launcher.template)
noextract=($pkgname-$pkgver.tar.gz)
md5sums=('b99aae489901f7f4915352a71cab0602'
         'f6e218f08bb5fc9dcd6a2bbc4da8c0db')

build() {
  cd "$srcdir"
  bsdtar --strip=1 -xf $pkgname-$pkgver.tar.gz || return 1
  install -Dm644 recipes/jpg.py "$pkgdir/usr/share/$pkgname/recipes/jpg.py"
  install -m644 recipes/videostream.py "$pkgdir/usr/share/$pkgname/recipes"
  install -m644 *.py "$pkgdir/usr/share/$pkgname"

  install -Dm755 launcher.template "$pkgdir/usr/bin/dumpstream"
  install -m755 launcher.template "$pkgdir/usr/bin/fetch"
  install -m755 launcher.template "$pkgdir/usr/bin/spider"
  install -m755 launcher.template "$pkgdir/usr/bin/$pkgname"
  install -m755 launcher.template "$pkgdir/usr/bin/web"
}
