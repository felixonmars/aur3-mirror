# Maintainer: Danny Arnold <despair.blue@gmail.com>
# Contributer: Danny Arnold <despair.blue@gmail.com>

pkgname=rbbr
pkgver=0.6.0
pkgrel=2
pkgdesc="Ruby Meta-Level Information Browser"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('custom:Ruby Distribute License' 'GPL')
depends=('ruby>=1.6.0' 'ruby-gtk2>=0.9.1')
makedepends=()
source=(http://downloads.sourceforge.net/ruby-gnome2/rbbr-0.6.0.tar.gz
	moduleview_crash.patch
	COPYING
	# http://ruby-gnome2.sourceforge.jp/data/ruby-gnome2-api.tar.gz
	)
md5sums=('00312556c37d830b7d15aa0988f65a37'
         '45b32717dc76eb1d5d275e124b6ed45c'
         '88d9dfab369f5010bc1fa2e0b6e319d9')

build() {
 cd $startdir/src/rbbr-$pkgver
 # cp -r ../ruby-gnome2-api data/rbbr/rd
 patch -Np1 -i ../moduleview_crash.patch || return 1
 ruby install.rb config --prefix=/usr
 ruby install.rb setup
 ruby install.rb install --prefix=$startdir/pkg
 mkdir $startdir/pkg/usr/share/licenses
 mkdir $startdir/pkg/usr/share/licenses/$pkgname
 cp ../COPYING $startdir/pkg/usr/share/licenses/$pkgname
}
