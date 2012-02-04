# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=lv2-dyn-manifest
pkgver=1.0
pkgrel=2
pkgdesc="Lv2 Dynamic Manifest extension"
arch=(any)
url="http://lv2plug.in/"
license=('BSD')
groups=('lv2extensions')
depends=('lv2core')
source=("$url/spec/$pkgname-$pkgver.tar.gz")
md5sums=('67647ff9c35f617daad1452c812ec576')

build() {
  return 0

  # nothing to do here
}

package() {
  cd "$srcdir/${pkgname/lv2-}.lv2"

  install -d "$pkgdir/usr/lib/lv2/${pkgname/lv2-}.lv2"
  install -Dm644 *.{ttl,h} "$pkgdir/usr/lib/lv2/${pkgname/lv2-}.lv2"

  # generate headers
  _ns=`grep "^<http" manifest.ttl \
      | sed "s|<http://\(.*\)>|\1|"`
  _name="${_ns/*\/}"
  _path="$pkgdir/usr/include/lv2/${_ns%/*}"
  [ -d "$_path" ] || install -d "$_path"
  ln -s "/usr/lib/lv2/$_name.lv2" "$_path/$_name"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  head -n 28 ${pkgname/lv2-}.h > \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
