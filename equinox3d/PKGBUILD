# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=equinox3d
pkgver=0.9.3.4
pkgrel=2
pkgdesc="3D modeler with fully integrated ray-tracer"
arch=('i686' 'x86_64')
url="http://www.equinox3d.com/"
license=('custom')
depends=('libgl')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libgl' 'lib32-libxt' 'lib32-libxext')
makedepends=('wget')
install=equinox.install
DLAGENTS=('http::/usr/bin/wget --tries=3 --output-document=%o %u')
source=(http://www.equinox3d.com/download/$pkgname-$pkgver-Linux.tgz \
        LICENSE equinox.sh equinox.desktop)
md5sums=('0899e9f44e2abb274de188c4e6bbee26'
         '1b9492494f25353cfd518acbc1a61ce6'
         '56ca4ee8c60ad8605a856213a4b89a8f'
         '7700536c72b3473b74729af91fa33baf')

package() {
  cd "$srcdir"/$pkgname-$pkgver-Linux/
  mkdir -p "$pkgdir"/opt/equinox3d
  cp -r * "$pkgdir"/opt/equinox3d

  install -D -m755 "$srcdir"/equinox.sh "$pkgdir"/usr/bin/equinox
  rm -rf "$pkgdir"/opt/equinox3d/src
  rm "$pkgdir"/opt/equinox3d/README
  rmdir "$pkgdir"/opt/equinox3d/Plugins/Examples/

  install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 "$srcdir"/equinox.desktop "$pkgdir"/usr/share/applications/equinox.desktop
  install -D -m644 "$srcdir"/$pkgname-$pkgver-Linux/icons/eqx.png \
  	"$pkgdir"/usr/share/pixmaps/equinox.png
}
