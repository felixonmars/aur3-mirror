# Maintainer:  Nicola Fontana <ntd@entidi.it>

pkgname=pforth-svn
pkgver=57
pkgrel=1
pkgdesc='A portable implementation of the Forth programming language written in ANSI C'
url='http://code.google.com/p/pforth/'
arch=('i686' 'x86_64')
license=('custom')
depends=()
makedepends=('subversion')
conflicts=('pforth')
provides=('pforth')
source=()
md5sums=()

_svntrunk='http://pforth.googlecode.com/svn/trunk/'
_svnmod='pforth-read-only'

build() {
  local BUILD_CFLAGS
  cd "$srcdir"

  if [ -d "$_svnmod/.svn" ]; then
    cd "$_svnmod"
    svn update -r "$pkgver"
    svn revert -R .
  else
    svn checkout "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod" && cd $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  BUILD_CFLAGS='-DPF_DEFAULT_DICTIONARY=\"/usr/share/pforth/pforth.dic\"'

  # --std=c89 implicitely declares off_t I/O functions such as ftello
  BUILD_CFLAGS="$BUILD_CFLAGS --std=c89"

  # -D_BSD_SOURCE=1 is defined to avoid the ‘ECHOCTL’ undeclared error
  BUILD_CFLAGS="$BUILD_CFLAGS -D_BSD_SOURCE=1"

  make -j 1 -f build/unix/Makefile all \
    SRCDIR=. FULL_WARNINGS= DEBUGOPTS= EXTRA_CCOPTS="$BUILD_CFLAGS"
}

package() {
  local prefix

  cd "$srcdir/$_svnmod"
  prefix="$pkgdir/usr"

  install -D -m755 pforth "$prefix/bin/pforth" || return 1
  install -D -m755 pforth_standalone "$prefix/bin/pforth_standalone" || return 1
  install -D -m644 pforth.dic "$prefix/share/pforth/pforth.dic"
  install -D -m644 readme.txt "$prefix/share/pforth/README"
  install -D -m644 releases.txt "$prefix/share/pforth/NEWS"
}

# vim:set ts=2 sw=2 et:
