# Maintainer: Tom Vincent <http://tlvince.com/contact/>
_pkgname=python2-boilerpipe
pkgname=$_pkgname-patched-git
_pkgver=1.2.0
pkgver=20120831
pkgrel=1
pkgdesc="Python interface to Boilerpipe, patched to use Boilerpipe SVN"
arch=(any)
url="https://github.com/misja/python-boilerpipe"
license=('GPL')
depends=('python2' 'jpype' 'python2-chardet' 'java-boilerpipe-svn')
makedepends=('git')
conflicts=("$_pkgname-git")
source=('setup.patch')
md5sums=('b46bdb35a553e424a4aa73691dd253a2')

_gitroot=https://github.com/misja/python-boilerpipe.git
_gitname=$_pkgname

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  patch < "$startdir/setup.patch"
}

package() {
  cd "$srcdir/$_pkgname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # http://stackoverflow.com/q/122327
  site_packages="$(python2 -c "from distutils.sysconfig import get_python_lib; \
    print(get_python_lib())")"

  boilerpipe_data="$pkgdir/$site_packages/boilerpipe/data/boilerpipe-$_pkgver"
  boilerpipe_sys="/usr/share/java/boilerpipe"

  mkdir -p "$boilerpipe_data/lib"
  ln -s "$boilerpipe_sys/boilerpipe-$_pkgver.jar" "$boilerpipe_data"
  ln -s "$boilerpipe_sys/nekohtml-1.9.13.jar" "$boilerpipe_data/lib"
  ln -s "$boilerpipe_sys/xercesImpl-2.9.1.jar" "$boilerpipe_data/lib"
}
