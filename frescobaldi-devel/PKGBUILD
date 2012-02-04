# Contributor: David Virgilio <drvirgilio@gmail.com>
# Contributor: Eduardo Pérez <eduardoperezval@gmail.com>
pkgname=frescobaldi-devel
pkgver=1.2.0
pkgrel=3
pkgdesc="A LilyPond sheet music editor for KDE4. It aims to be powerful, yet lightweight and easy to use. Development release."
arch=('i686' 'x86_64')
url="http://www.frescobaldi.org/" 
license="GPL"
depends=('kdebase-kwrite' 'lilypond' 'python>=2.4.0' 'python2-qt' 'kdebindings-python')
conflicts=('frescobaldi')
optdepends=('rumor' 'kmid2' 'fluidr3')
install=
makedepends=('automoc4' 'cmake' 'docbook-xml' 'docbook-xsl')
source=(http://lilykde.googlecode.com/files/frescobaldi-$pkgver.tar.gz)
md5sums=('e5dbc9425e3aae9890d54649b3d60166')

build() { 
	cd $startdir/src/frescobaldi-$pkgver 
	cmake . -DCMAKE_INSTALL_PREFIX=$(kde4-config --exec-prefix) || return 1
	make || return 1
	make install DESTDIR=$pkgdir || return 1
}
