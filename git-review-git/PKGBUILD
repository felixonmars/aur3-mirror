# Maintainer: Kasper Laudrup <laudrup@stacktrace.dk>

pkgname=git-review-git
pkgver=1.22.1.g8899c9f
pkgrel=3
pkgdesc="A git command for submitting branches to Gerrit"
arch=('any')
url="https://labsconsole.wikimedia.org/wiki/Git-review"
license=('Apache')
depends=('python2')
conflicts=('git-review')
provides=('git-review')
makedepends=('git' 'python2-distribute')
options=(!emptydirs)
md5sums=()

_gitroot=https://github.com/openstack-infra/
_gitname=git-review

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot$_gitname.git"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
