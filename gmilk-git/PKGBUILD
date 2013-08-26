# Contributor: Adam Tonks <adam@adam-tonks.co.uk>

_pkgname=gmilk
pkgname=gmilk-git
pkgver=67.18b893b
pkgrel=1
pkgdesc="GTK tray icon for Remember the Milk"
arch=('any')
url="https://github.com/taq/gmilk"
license=('GPL')
depends=('python2-gconf' 'pygtk')
makedepends=('git')
source=(git://github.com/taq/gmilk)
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's/python/python2/g' *.py
}

package() {
  cd "$srcdir/$_pkggname"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/
  mkdir -p $pkgdir/usr/share/locale/pt_BR/LC_MESSAGES/
  make BASE="$pkgdir/usr/share/pyshared/\$(APP)" BIN="$pkgdir/usr/bin/gmilk" LOCALE="$pkgdir/usr/share" install
  rm $pkgdir/usr/bin/gmilk
  ln -s /usr/share/pyshared/gmilk/lib/gmilk.py $pkgdir/usr/bin/gmilk
}

# vim:set ts=2 sw=2 et:
