# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from SVN sources.

# Maintainer: Filippov Aleksey <sarum9in@gmail.com>
pkgname=boost.process-svn
pkgver=61903
pkgrel=1
pkgdesc="Unofficial boost process library"
arch=('any')
url="http://www.highscore.de/boost/process/"
license=('GPL')
groups=()
depends=(boost)
makedepends=('subversion')
provides=(boost.process)
conflicts=(boost.process)
replaces=()
backup=()
options=()
install=
source=('filesystem.patch' 'boost_system_system_category.patch' 'mingw32.patch')
noextract=()
md5sums=('8e56dc15541a0160408b6fda1d5cc2eb'
         'a8746c197dc4b34057e6d58a2085c79f'
         'a16ab29dc440f261f613ec3b0d43c7c0')

_svntrunk="http://svn.boost.org/svn/boost/sandbox/process/boost/"
_svnmod="boost.process"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  cd "$srcdir/$_svnmod-build"
  patch -Np1 -i "../filesystem.patch"
  patch -Np1 -i "../boost_system_system_category.patch"
  patch -Np1 -i "../mingw32.patch"
}

package() {
  cd "$srcdir/$_svnmod-build"
  dest="$pkgdir/usr/include/boost"
  install -d "$dest"
  tar cf - --exclude-vcs . | (cd "$dest" && tar xf -)
}

# vim:set ts=2 sw=2 et:
