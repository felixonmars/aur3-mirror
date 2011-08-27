# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=lyriczilla
pkgver=svn
pkgrel=1
pkgdesc="LyricZilla is a lyric player under linux"
arch=(i686 x86_64)
url="http://lyriczilla.googlecode.com"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(audacious)
install=
#source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #generate with 'makepkg -g'

_svnurl="$url/svn/trunk $pkgname-read-only"

build() {
  cd "$srcdir/"
  svn checkout $_svnurl
  cd $pkgname-read-only

  sed -i 's@$(libdir)/python2.5@$(libdir)/python2.6@g' lyriczilla/Makefile.in lyriczilla/Makefile.am 
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
