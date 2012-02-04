# Contributor: Mathias Burén <mathias.buren@ŋmail.com>
pkgname=kimboot
pkgver=1.00
pkgrel=1
pkgdesc="A physics driven game written in Python."
arch=('i686')
url="http://kimboot.sourceforge.net/"
license=('unknown')
depends=(python python-opengl python-pygame python-pyode-cvs)
install=
source=(http://dl.sourceforge.net/sourceforge/kimboot/kimboot-1.00-src.tar.bz2 kimboot)
md5sums=('524b6836e3b7ad8317ba77ead4aa0604' '346352a9d39693b8a29b918c33e72a0c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/share/kimboot
  cp -R * $startdir/pkg/usr/share/kimboot/
  install -D --mode=755 -T $startdir/src/kimboot $startdir/pkg/usr/bin/kimboot
  chmod 766 $startdir/pkg/usr/share/kimboot/options.xml
}

