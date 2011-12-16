# obmenugen by Pável Varela Rodríguez [NeOnsKuLL] <neonskull@gmail.com>
# PKGBUILD and patches by hasufell
pkgname=obmenugen-bin-fix
pkgver=0.4.3
pkgrel=2
_serie=0.4
_pkgrev=56
pkgdesc="Menu generator for Openbox3, based on .desktop files (statically compiled) with personal fixes"
url="https://launchpad.net/obmenugen"
arch=('i686' 'x86_64')
license=('GPL')
depends=(openbox)
conflicts=(obmenugen-bin)
provides=(obmenugen-bin)
options=('!strip' 'docs')
source=(http://launchpad.net/obmenugen/$_serie/$pkgver/+download/obmenugen-$pkgver-r$_pkgrev.tar.bz2
http://ftp.digitalmars.com/dmd.2.030.zip
math.d::'http://www.dsource.org/projects/phobos/browser/trunk/phobos/std/math.d?rev=1175&format=raw'
config.patch
global_data.patch
linuxmak.patch)
md5sums=('b84a76b62892ca5cd0e710d09e68e2c1'
         '1683afd695d1c2c0d0e9ab844c6d8ad6'
         '1fda6290203e7869901308c499d7a3cd'
         '7887da1b9bb9327c80405c9e74bb00f8'
         '1b67fd7d796a364b8267a1f7cdb2b98b'
         '71b719ecb1eebe90b1b12b4ad8702930')

[ "$CARCH" = "x86_64" ] && depends=(${depends[@]} lib32-glibc)

build() {

  cd $srcdir/dmd
  	patch -p1 < $srcdir/linuxmak.patch
  cd $srcdir/dmd/src/dmd

	ln -s . mars
	make -f linux.mak MODEL=$archstr
	cp -f dmd idgen impcnvgen optabgen $srcdir/dmd/linux/bin
	cat <<END > "dmd.conf"
[Environment]
DFLAGS=-I%@P%/../phobos -I%@P%/../druntime/import -L-L%@P%/../lib
END
	oldpath=$PATH
	export PATH=$PATH:`pwd`

  cd $srcdir/dmd/src/druntime/src
	make -f dmd-posix.mak
	chmod 644 ../import/core/*.di
	chmod 644 ../import/core/sync/*.di

  cd $srcdir/dmd/src/phobos
	cp -f $srcdir/math.d ./std
	make -f linux.mak
	cp -f obj/posix/release/libphobos2.a $srcdir/dmd/linux/lib

  cd $srcdir/obmenugen-$pkgver-r$_pkgrev
  	patch -p1 < $srcdir/config.patch
  	patch -p1 < $srcdir/global_data.patch
  	$srcdir/dmd/linux/bin/dmd ./src/*.d -O -release -inline -od/tmp/ -of$pkgdir/usr/bin/obmenugen
  	install -Dm755 html/obmenugen.html $pkgdir/usr/share/doc/obmenugen.html || return 1
  
  cd translations/
  	for T in *;do
	install -Dm644 ../translations/$T/LC_MESSAGES/obmenugen.po $pkgdir/usr/share/obmenugen/translations/$T/LC_MESSAGES/obmenugen.po || return 1
  done
}
