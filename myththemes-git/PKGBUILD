# Contributor: vaca

pkgname=myththemes-git
pkgver=20110427
pkgrel=1
pkgdesc="Themes for MythTV 0.24-fixes"
arch=('i686' 'x86_64')
url="http://www.mythtv.org/"
license=('GPL')
depends=("mythtv-git")
#options=('force')
conflicts=('myththemes')
_gitname="myththemes"
_gitroot="https://github.com/MythTV/myththemes.git"

build() {
  cd "${srcdir}"

  if [ -d $_gitname/.git ]; then
      cd $_gitname
      git pull && git pull origin
      msg "The local files are updated."
  else
      git clone -b fixes/0.24 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"
  ./configure --prefix=/usr 
  # basic install
  make INSTALL_ROOT="${pkgdir}" install || return 1
}
