# Maintainer: Aldo Culquicondor <alculquicondor@gmail.com>
pkgname=codeforces-runner-git
pkgver=1.0
pkgrel=1
pkgdesc="Runner and checker for Codeforces contests"
arch=('any')
url="https://github.com/alculquicondor/CodeforcesRunner"
depends=('python2-lxml')
makedepends=('git')
install="${pkgname}.install"
license=('GPL')
md5sums=()
replaces=('cfrunner-git')

_gitroot=git://github.com/alculquicondor/CodeforcesRunner.git
_gitname=CodeforcesRunner
build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  msg "$PWD"

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/share/codeforces-runner" "$pkgdir/usr/bin"
  install "cf.py" "$pkgdir/usr/share/codeforces-runner/"  
  cp "conf.py.example" "$pkgdir/usr/share/codeforces-runner/"  
  ln "$pkgdir/usr/share/codeforces-runner/cf.py" "$pkgdir/usr/bin/cfrunner" 
}

# vim:set ts=2 sw=2 et:
