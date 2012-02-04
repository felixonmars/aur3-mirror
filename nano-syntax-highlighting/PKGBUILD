# Contributor: Sorin Ionescu <sorin.ionescu@gmail.com>
# Contributor: Jeremy Sands cto@jeremysands.com
pkgname=nano-syntax-highlighting
pkgver=20080907
pkgrel=1
pkgdesc="Nano editor syntax highlighting enhancements"
arch=('i686' 'x86_64')
depends=('nano')
url="http://www.jeremysands.com/archlinux/"
license=('GPL-2')
install=nano-syntax-highlighting.install
source=(nanorc)
md5sums=('7e9efa3752de1be7780f120223dda674')
build()
{
  cd "$startdir"/pkg/
  mkdir -p usr/share/nano-syntax-highlighting
  
  cd "$startdir"/src/
  cp nanorc "$startdir"/pkg/usr/share/"$pkgname"/nanorc
}

# vim:set ts=2 sw=2 et:
