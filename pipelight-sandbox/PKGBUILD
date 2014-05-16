# Maintainer: Steven Batchelor <admin@ovgl.org>
pkgname=pipelight-sandbox
pkgver=625.362f2c7
pkgrel=1
pkgdesc="This is an experimental version of pipelight which includes sandbox support and uses an SUID binary."
arch=("i686" "x86_64")
url="https://launchpad.net/pipelight" #Also http://fds-team.de/cms/articles/2013-08/pipelight-using-silverlight-in-linux-browsers.html
license=('GPL')
makedepends=()
depends=() 
optdepends=()
provides=("pipelight-sandbox")
#options=()
install=""
_name=pipelight-sandbox
source=("$_name::git+https://bitbucket.org/mmueller2012/pipelight-sandbox.git")
groups=("pipelight-devel")

build() {

	cd "$srcdir/$_name"
	make

}

package() {
	cd "$srcdir/$_name"
	make DESTDIR="$pkgdir/" install
	install -d -m 755 $pkgdir/usr/share/pipelight/sandbox
	ln -s $pkgdir/usr/bin/wine-sbox $pkgdir/usr/share/pipelight/sandbox
}

pkgver() {
  cd "$srcdir/$_name"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP')
