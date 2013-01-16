# Maintainer: el_torcedor <florian dot plaza at gmail dot com>

pkgname=jonesforth
pkgver=47
pkgrel=1
pkgdesc="A sometimes minimal FORTH compiler and tutorial"
arch=('i686' 'x86_64')
url="http://rwmj.wordpress.com/2010/08/07/jonesforth"
license=('custom')
makedepends=('git' 'gcc')
_gitroot="git://git.annexia.org/git/jonesforth.git"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [ -d $pkgname ]; then
	  cd $pkgname && git pull origin
	  msg "The local files are updated."
  else
	  git clone $_gitroot
  fi

  cd "$srcdir/$pkgname"
  sed -i -e '11s/-Wl,-Ttext,0 $(BUILD_ID_NONE)//' Makefile
  make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
