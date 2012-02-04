# Contributor: David Virgilio <drvirgilio@gmail.com>

pkgname=lilypond-kde4
pkgver=0.3
pkgrel=1
pkgdesc="A package for KDE 4.1 with basic tools to make working with the GNU LilyPond music typesetter in KDE 4 easier.  Not for KDE 4.2"
arch=('i686' 'x86_64')
url="http://code.google.com/p/lilykde/" 
license="GPL"
depends=('kdebase>=4.1.0' 'lilypond')
install=lilypond-kde4.install
makedepends=('automoc4' 'cmake')
source=(http://lilykde.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('ca4bf0f6a2ee409d24df38113ffe211b')

build() { 
	cd $startdir/src/$pkgname-$pkgver 
	cmake . -DCMAKE_INSTALL_PREFIX=/opt/kde/ || return 1
	make || return 1
	make install DESTDIR=$pkgdir || return 1
}
