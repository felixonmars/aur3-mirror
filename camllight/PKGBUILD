# Contributor: Michelle Beloshitsky <itanko@ort-yagun.ath.cx>
pkgname=camllight
pkgver=0.75
pkgrel=2
pkgdesc="Lightweight portable implementation of the caml language written by Xavier Leroy"
arch=('i686')
url="http://caml.inria.fr/caml-light/index.en.html"
license=('custom')
makedepends=()
conflicts=('ocaml')
source=(http://caml.inria.fr/pub/distrib/caml-light-0.75/cl75unix.tar.gz \
	cl75.patch)
md5sums=('6c236074e4487949ec22001c7a498057'
         '33feed581a771b1c66fad156cf3e6d61')

build() {
	  cd "$srcdir/cl75"
	  patch -Np1 -i ../cl75.patch || return 1
	  cd "$srcdir/cl75/src"
	  make configure || return 1
	  make world || return 1
	  make bootstrap || return 1
	  mkdir $startdir/pkg/usr
	  mkdir $startdir/pkg/usr/lib
	  mkdir $startdir/pkg/usr/man
	  make prefix=$startdir/pkg/usr install || return 1
	  install -D -m 644 $srcdir/cl75/COPYRIGHT $startdir/pkg/usr/share/licenses/camllight/LICENSE
	}
