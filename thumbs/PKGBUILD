# Maintainer : SpepS <dreamspepser at yahoo dot it>

_name=Thumbs
pkgname=thumbs
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple ROX-Filer thumbnail image manager"
arch=('any')
url="http://www.kerofin.demon.co.uk/rox/$_name.html"
license=('GPL')
depends=('rox' 'rox-lib' 'pygtk')
source=("http://www.kerofin.demon.co.uk/rox/$_name-$pkgver.tar.gz"
        "$_name.xml")
md5sums=('b7a4535753a3f19258a84148cbdfcb88'
         '624f42da85376eb467041c10597328f1')

build() {
  return 0
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/share"
  cp -a $_name $pkgdir/usr/share

  # launcher
  install -d "$pkgdir/usr/bin"
  cat << EOF > "$pkgdir/usr/bin/$_name"
#!/bin/sh
exec /usr/share/$_name/AppRun \$@
EOF
  chmod +x "$pkgdir/usr/bin/$_name"

  # python2 fix
  sed -i "s/env python/&2/" \
    ${pkgdir}/usr/share/$_name/{AppRun,do_manage}

  # zeroinstall feed + fix
  install -Dm644 ../$_name.xml \
    "$pkgdir/usr/share/$_name"
}
