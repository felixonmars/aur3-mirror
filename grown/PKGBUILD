#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=grown
pkgver=2012.5.14
pkgrel=1
pkgdesc='A directory watcher that synchronizes file ownership and modes for group collaboration.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/grown"
source=(
  http://xyne.archlinux.ca/projects/grown/archives/grown-2012.5.14.tar.xz
  http://xyne.archlinux.ca/projects/grown/archives/grown-2012.5.14.tar.xz.sig
)
sha512sums=(
  e19b2a113bc915584705419f84291b678b2de6c60ac5d89e2ebe7a0b4e82fd25763ab934ffc07fd3e2a87ff0afaba56365a507ef98d03d7a5eaa1cb609d33e42
  d81bafc55f4bed0d13d860332f7517c191c546975b48b4c2733a0d181a30e5458c673ea0298d383ef6275ed98393707e10222a166b3dda8a2c2cc10af105c4e4
)
md5sums=(
  d357eede02798a06c5a0560eca898d90
  e6f7afe560f42f84a230e05250506913
)

build ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  gcc -O2 -o "$pkgname" "$pkgname.c"
}

package ()
{
  install -D -m755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname";
}

# vim: set ts=2 sw=2 et:
