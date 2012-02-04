# Contributor: TheStarLion <thestarlion@hotmail.com>
pkgname=catcodec-svn
pkgver=20613
pkgrel=1
pkgdesc="Tools for working with OpenTTD .cat files"
arch=('i686' 'x86_64')
url="http://www.openttd.org/en/download-catcodec"
license=('GPL2')
depends=()
makedepends=('subversion' 'gcc')
provides=(catcodec)
conflicts=(catcodec)
install=
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=svn://svn.openttd.org/extra/catcodec

build() {
  cd "$srcdir"

  if [ -d catcodec/.svn ]; then
    (cd catcodec && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver catcodec
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/catcodec-build"
  cp -r "$srcdir/catcodec" "$srcdir/catcodec-build"
  cd "$srcdir/catcodec-build"

  #
  # BUILD
  #

  make || return 1
  make DESTDIR="$pkgdir/" install
}
