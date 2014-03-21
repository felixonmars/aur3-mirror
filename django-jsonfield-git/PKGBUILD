# Maintainer: Yichao Yu <yyc1992@gmail.com>

_pkgname=django-jsonfield
pkgname="${_pkgname}-git"
pkgver=162.91ff795
_realver=0.9.17
pkgrel=1
pkgdesc="A reusable Django field that allows you to store validated JSON in your model."
arch=('any')
license=('MIT')
url="https://github.com/bradjasper/django-jsonfield/"
depends=('python>=3.4' 'python<3.5' 'python-django')
makedepends=('python2-distribute')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

_gitname="django-jsonfield"

_gitroot="https://github.com/bradjasper/django-jsonfield/"
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

  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"

  python setup.py install --root="${pkgdir}"
}
