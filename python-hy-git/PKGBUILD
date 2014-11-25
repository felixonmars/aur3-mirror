# Maintainer: devlin zed <me@devlinzed.com>

pkgbase=python-hy-git
pkgname="${pkgbase}-git"
_realver=0.10.1
pkgver=0.10.1.31.g49073b8
pkgrel=1
pkgdesc="Hy is a Python <--> Lisp layer. It helps make things work nicer, and
lets Python and the Hy lisp variant play nice together."
epoch=1
url="http://hylang.org"
arch=('any')
license=('MIT')
depends=('python' 'python-astor-git' 'python-rply-git')
makedepends=('git' 'python-setuptools')
provides=("${pkgbase}=${_realver}")
conflicts=("${pkgbase}")
replaces=()
optdepends=()

_gitroot="git://github.com/hylang/hy"

_gitname="hy"
_gitref="master"

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

  git describe | sed -e 's/-/./g'
}

build() {
  (_fetch_git)
  cd "$srcdir/$_gitname"

  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"

  # first copying hy
  python setup.py install --root="$pkgdir" --optimize=1

  # copying license information
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # copying readme information
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -D -m644 AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
}
