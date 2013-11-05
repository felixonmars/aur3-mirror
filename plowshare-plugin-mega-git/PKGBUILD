pkgname=plowshare-plugin-mega-git
pkgver=64ee2ac589ed
pkgrel=1
pkgdesc="plowshare plugin for mega.co.nz"
arch=('i686' 'x86_64')
url="http://code.google.com/p/plowshare/"
license=('GPL')
depends=('plowshare' 'openssl')
makedepends=('git')
conflicts=('')
provides=('')
install=plugin.install

md5sums=('SKIP')
_gitroot=("https://code.google.com/p/plowshare.plugin-mega/")
_gitname="plugin-mega"

pkgver() {
  cd "$srcdir"
  echo $(git describe --always | sed 's/-/./g')
  # for git, if the repo has no tags, comment out the above and uncommnet the next line:
  #echo "$(git shortlog | grep -c '\s\+').$(git describe --always)"
  # This will give you a count of the total commits and the hash of the commit you are on.
  # Useful if you're making a repository with git packages so that they can have sequential
  # version numbers. (Else a pacman -Syu may not update the package)
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sed -i "s/check_plowdir //" Makefile
  sed -i "28i \\\t\$\(INSTALL\) \-d \$\(PLOWDIR\)\/modules" Makefile

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX="$pkgdir"/usr install
  mv $pkgdir/usr/share/plowshare4/modules/config $pkgdir/usr/share/plowshare4/modules/config.mega
}
