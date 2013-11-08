# Maintainer: M4rQu1Nh0S <zonadomarquinhos@gmail.com>
pkgname=industrial-arch-lxdm
pkgver=8ab2dc2
pkgrel=1
pkgdesc="Arch linux theme based in a Industrial Theme for LXDM"
arch=('any')
url="http://github.com/M4rQu1Nh0S/industrial-arch"
license=('GPL')
groups=('lxdm')
depends=('lxdm')
makedepends=('git')
install=set.install
source=('set.install'
        "$pkgname"::'git+https://github.com/M4rQu1Nh0S/industrial-arch.git')
md5sums=('60aeed91a8673f1aa46287274f6f57e6'
         'SKIP')

#_gitroot=https://github.com/M4rQu1Nh0S/industrial-arch.git
#_gitname=industrial-arch

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
  mkdir -p "$pkgdir/usr/share/lxdm/themes/"
  cp -r "$srcdir/$pkgname" "$pkgdir/usr/share/lxdm/themes/"
#  rm -r "$pkgdir/usr/share/lxdm/themes/$_gitname/.git/"
}

# vim:set ts=2 sw=2 et:
