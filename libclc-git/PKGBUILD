# Maintainer: Yichao Yu <yyc1992@gmail.com>
# Contributor: Armin K. <krejzi at email dot com>

pkgname=libclc-git
pkgver=123.9908d94
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('i686' 'x86_64')
url="http://libclc.llvm.org/"
license=('MIT')
makedepends=('clang' 'git' 'python2')
options=('strip' 'debug')
provides=(libclc libclc-svn)
conflicts=(libclc libclc-svn)

_gitname="libclc"

_gitroot="http://llvm.org/git/libclc.git"
_gitref=master
exec 5>&1

_fetch_git() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    git clean -fdx
    msg "Fetching branch $_gitref from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitref:$_gitref" --
    msg "Checking out branch $_gitref..."
    git checkout "$_gitref" --
    git reset --hard "$_gitref"
    git clean -fdx
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitref from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitref" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
}

pkgver() {
  (_fetch_git >&5 2>&1)
  cd "$srcdir/$_gitname"

  echo "$(git rev-list --count "${_gitref}").$(git rev-parse --short "${_gitref}")"
}

prepare() {
  (_fetch_git)
  cd "$srcdir/$_gitname"

  # disable nvptx target, fixes build with latest clang/llvm
  sed -i "/default_targets/s:'nvptx--nvidiacl', 'nvptx64--nvidiacl', ::" \
    configure.py
}

build() {
  (_fetch_git)
  cd "$srcdir/$_gitname"

  python2 ./configure.py --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"

  make install DESTDIR="$pkgdir"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
