# Contributor: Ваше Имя <email собака domain точка com>

pkgname='dumb-old'
pkgver='0.9.2'
pkgrel='1'
pkgdesc="Version 0.9.2 of dumb library. It is used as ufo2000 game dependency - newer versions do not work. Should be built with Allegro support when asked during buildtime"
arch=('i686' 'x86_64')
url="http://dumb.sourceforge.net/"
license=('custom')
groups=()
depends=(allegro)
makedepends=()
optdepends=()
provides=(dumb-old)
conflicts=(dumb)
replaces=()
backup=()
options=()
install=
source=(http://nchc.dl.sourceforge.net/sourceforge/dumb/dumb-0.9.2-fixed.tar.gz)
noextract=()
md5sums=('0ce45f64934e6d5d7b82a55108596680')
build() {
	  cd $srcdir/dumb
	      export CFLAGS+="-march=i686"
	      PREFIX=/usr make || return 1
	      sudo make DESTDIR=$pkgdir install || return 1
	}
