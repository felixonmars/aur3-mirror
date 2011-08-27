# Maintainer: FaziBear <fazibear@gmail.com>

pkgname=korundum
pkgver=3.5.5
pkgrel=1
pkgdesc="Ruby bindings for the KDE."
url="http://rubyforge.org/projects/korundum/"
depends=('ruby' 'kdelibs' 'qscintilla')
source=(http://rubyforge.rubyuser.de/korundum/korundum-$pkgver.tgz)
conflicts=('kdebindings' 'ruby-qt' 'ruby-kde')
replaces=('ruby-qt' 'ruby-kde')
provides=('ruby-qt' 'ruby-kde')
arch=('i686')
license=('GPL')
md5sums=('1bd326dda7f5e402306e71da14cf8933')

build() {
	cd $startdir/src/korundum-$pkgver/

	make -f Makefile.cvs
	./configure --prefix=/usr --with-qt-includes=/opt/qt/include --enable-qscintilla=yes

	make || return 1
	make DESTDIR=$startdir/pkg install

	# Remove the .la files
	find $startdir/pkg -name '*.la' -exec rm -f {} \;
}

