# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  perlawk
pkgname=nial  
pkgver=20130414
pkgrel=1 
pkgdesc="An array programming language, like APL and J, but much more easy to learn and read."
url="http://www.nial.com/"
arch=(any)
license=('Artistic Licence')
depends=('ncurses')
makedepends=('git')
conflicts=()
replaces=()
backup=()
install=nial.install
source=()

md5sums=(fdcba49503eced52fa8b1b6f9159110b)
_gitroot=https://github.com/vrthra/qnial.git
_gitname=${pkgname}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

  cd $startdir/src/${pkgname}/build
	cp linuxmakefile.txt makefile
	sed -i 's/-ltermcap/-lncurses/g; s/CCC= g++/CCC=g++ -m32 /g; s/CC= gcc/CC= gcc -m32 /g' makefile
  make -j4 || return 1

  install -m755 -d $pkgdir/usr/lib/nial/bin
  install -m755 -d $pkgdir/usr/bin
	cp ../niallib -a $pkgdir/usr/lib/nial/
	cp nial $pkgdir/usr/lib/nial/bin/
	#cp $startdir/nial $pkgdir/usr/bin/
}
