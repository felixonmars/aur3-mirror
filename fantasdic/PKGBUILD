# Contributor: Simon Lipp <sloonz+aur@gmail.com>
# Former contributor: Marek Bernat <marek.bernat@gmail.com>

pkgname=fantasdic
pkgver=1.0beta7
_pkgver=1.0-beta7
pkgrel=1
pkgdesc="A client for the DICT protocol"
arch=(i686 x86_64)
license="GPL"
url="http://www.gnome.org/projects/fantasdic"
depends=(ruby ruby-gettext ruby-gtk2 ruby-libglade)
makedepends=()
source=(http://www.mblondel.org/files/fantasdic/$pkgname-1.0-beta7.tar.gz
        fantasdic-ruby9.patch)
md5sums=('fdd9d6661a38ae8d23bcd9a05d12a6b6'
         'f105cd93a99de3d9016c9c50ff366807')
	 
build() {
  cd $startdir/src/$pkgname-$_pkgver
  patch -p1 < $srcdir/fantasdic-ruby9.patch || return 1
  ruby setup.rb config
  ruby setup.rb setup
  ruby setup.rb install --prefix=$startdir/pkg
}
