# Maintainer: Yichao Yu <yyc1992@gmail.com>

pkgbase=kmoefm
pkgname=${pkgbase}-git
pkgver=17.d0c58e6
pkgrel=1
pkgdesc="A Moe FM client under KDE based on QML."
arch=('i686' 'x86_64')
url="https://github.com/csslayer/kmoefm"
license=('GPL')
depends=('kdelibs' 'qjson' 'qca' 'qoauth' 'phonon' 'desktop-file-utils')
makedepends=('cmake' 'git')
conflicts=("${pkgbase}")
provides=("${pkgbase}")
install=kmoefm.install
options=(strip debug)

_gitname="kmoefm"

_gitroot="https://github.com/csslayer/kmoefm.git"
_gitref=master

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
  local outfile=/dev/null
  [[ -e /dev/tty ]] && outfile=/dev/tty
  (_fetch_git &> ${outfile})
  cd "$srcdir/$_gitname"

  echo "$(git rev-list --count "${_gitref}").$(git rev-parse --short "${_gitref}")"
}

build() {
  (_fetch_git)
  cd "$srcdir/$_gitname"

  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"

  make DESTDIR="$pkgdir" install
}
