# Contributor: Adam <adam@russ.co.il>
pkgname=openboxlogout-gnome
_pkgname=openboxlogout
pkgver=0.1
pkgrel=1
pkgdesc="Openbox Logout Script, Patched to work in gnome"
arch=('i686' 'x86_64')
url="https://launchpad.net/oblogout"
depends=('python' 'pygtk' 'cairo' 'pil')
replaces=(openboxlogout)
conflicts=(openboxlogout)
license=('GPL')
source=(http://launchpad.net/oblogout/0.1/0.1-1/+download/$_pkgname-$pkgver-$pkgrel.tar.gz
	gnome.patch)

build() {
  cd $startdir/src/$_pkgname-$pkgver
  patch -Np0 -i ../gnome.patch || return 1
  python setup.py install --root=$startdir/pkg/ || return 1
}

md5sums=('97aed876dcfda9a0e73ab9bbfa5fab16'
         '27cbad94d3b09a574532f15fa61bf343')
