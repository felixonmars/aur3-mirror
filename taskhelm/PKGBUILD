# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit.com>

pkgname=taskhelm
pkgver=0.4.1
pkgrel=1
pkgdesc="A graphical shell that sits on top of TaskWarrior"
arch=(any)
url="http://taskwarrior.org/projects/taskwarrior/wiki/Taskhelm"
license=("GPL")
depends=('task' 'pygtk' 'python2-jsonpickle')
source=("http://www.bryceharrington.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root "$pkgdir" --optimize=1
}
sha256sums=('13a840f665f4ecf812386aca809cba8eb0a539f580d82eccc020604bc61f9e99')
