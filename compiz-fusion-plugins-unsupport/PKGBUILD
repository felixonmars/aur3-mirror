# Contributor: linfan <borje4 at gmail . com>, nesl247 <nesl247 at gmail . com>, DaNiMoth <jjdanimoth at gmail . com>, 
# Contributor: M Rawash <mrawash @ gmail com>
# Maintainer: Cedric Mathieu <me.xenom at gmail . com>

pkgname=compiz-fusion-plugins-unsupport
pkgver=0.8.4
pkgrel=1
pkgdesc="Compiz Fusion Unsupported plugins"
arch=('i686' 'x86_64')
url="http://opencompositing.org"
license=('GPL')
depends=('compiz-fusion-plugins-main>=0.8.4')
makedepends=('intltool' 'pkgconfig' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('compiz-fusion-plugins-extra-git')
source=(http://releases.compiz-fusion.org/$pkgver/compiz-plugins-unsupported-$pkgver.tar.bz2)
md5sums=('73c7d70040cd4fd48ea29677b0f2f21e')

build() {
	cd $srcdir/compiz-plugins-unsupported-$pkgver
	./configure --prefix=/usr || return 1
    
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}

