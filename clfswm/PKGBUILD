# Contributor: hocwp <hocwp[at]free[dot]fr>

pkgname=clfswm
pkgver=1212
pkgrel=1
pkgdesc="A(nother) Common Lisp FullScreen Window Manager"
url="http://common-lisp.net/project/clfswm/"
license='GPL'
arch=('i686' 'x86_64')
depends=('clisp')
makedepends=('cvs')
backup=()
conflicts=()
provides=()
source=(http://common-lisp.net/project/clfswm/clfswm-$pkgver.tar.gz)
md5sums=(e06d222b494d11745ed053dd5bfbb0fd)
options=(!strip)

build() {
	cd $startdir/src/$pkgname-$pkgver
	sed -ie 's#;; (setf \*contrib-dir\* "/usr/local/lib/clfswm/")#(setf *contrib-dir* "/usr/lib/clfswm/")#g' $startdir/src/$pkgname-$pkgver/load.lisp
	make || return 1
	make DESTDIR=$startdir/pkg/usr/ install
}

