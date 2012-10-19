# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=absinthe
pkgver=2.0.4
pkgrel=1
pkgdesc="An untethered jailbreak for iOS 5.1.1 devices"
arch=('i686' 'x86_64')
url="http://greenpois0n.com/"
license=('GPL')
depends=('gtk2' 'lib32-libxml2')
changelog=
source=($pkgname-linux-$pkgver.tar.bz2::https://sites.google.com/site/greenpois0nabsinthe/absinthe-linux-2.0.4.tar.bz2?attredirects=0)
noextract=()
md5sums=('dcec3a5aee4ed26ca9387167a705a729')

package() {
  if [ "$arch" = "i686" ]; then
    install -D -m755 $srcdir/$pkgname-linux-$pkgver/absinthe.x86 $pkgdir/opt/absinthe/absinthe
  elif [ "$arch" = "x86_64" ]; then
    install -D -m755 $srcdir/$pkgname-linux-$pkgver/absinthe.x86_64 $pkgdir/opt/absinthe/absinthe
  fi
  cp -r $srcdir/$pkgname-linux-$pkgver/data/ $pkgdir/opt/absinthe/
  chmod 644 -R $pkgdir/opt/absinthe/data/
  chmod a+X -R $pkgdir/opt/absinthe/data/
}

# vim:set ts=2 sw=2 et:
