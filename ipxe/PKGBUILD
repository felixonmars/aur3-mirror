# Maintainer: Loper <poczta at lopers dot pl>
pkgname=ipxe
pkgver=4484.31f5211
pkgrel=1
pkgdesc="Provides a full PXE implementation enhanced with additional features"
arch=('i686' 'x86_64')
url="http://ipxe.org"
license=('GPL')
depends=('mkisolinux')
makedepends=('git' 'make')
privides=('ipxe' 'ipxe-git')
conflicts=('ipxe-git')
#source=('http://git.ipxe.org/ipxe.git')
md5sums=('SKIP')
_dest="/usr/share"

build() {
  cd "$srcdir/$pkgname/src"

  cat > start.ipxe <<EOF
#!ipxe
set use-cached 1
dhcp
chain http://\${next-server}/menu.ipxe
EOF

  make bin/undionly.kpxe EMBED=start.ipxe
  make bin/undionly.kkpxe EMBED=start.ipxe
  make bin/ipxe.iso
  make bin/ipxe.usb
}

package() {
  msg "Creating directories..."
  mkdir -p $pkgdir/$_dest/$pkgname
  msg "Coping files..."
  mv $srcdir/$pkgname/src/bin/undionly.kpxe $pkgdir/$_dest/$pkgname
  mv $srcdir/$pkgname/src/bin/undionly.kkpxe $pkgdir/$_dest/$pkgname
  mv $srcdir/$pkgname/src/bin/ipxe.usb $pkgdir/$_dest/$pkgname
  mv $srcdir/$pkgname/src/bin/ipxe.iso $pkgdir/$_dest/$pkgname
}


pkgver() {
  msg "Cloning from repository..."
	git clone http://git.ipxe.org/ipxe.git
  cd $srcdir/$pkgname
  echo "$(git rev-list --count HEAD).$(git describe --always)"
}

