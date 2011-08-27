# Maintainer: addikt1ve <the.addikt1ve@gmail.com>
# Contributor : sigma <sigma_github@melix.net>

pkgname=shblog-git
pkgver=20100625
pkgrel=1
pkgdesc="sh-written blog engine generating static HTML pages"
arch=('i686' 'x86_64')
url="http://github.com/addikt1ve/shblog"
license=('GPL')
depends=('coreutils')
makedepends=('git')
provides=('shblog')
conflicts=('shblog')
#backup=('/etc/shblog/shblog.conf')

_gitroot=http://github.com/addikt1ve/shblog.git
_gitname=shblog

build () {
  cd "$srcdir"

	msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd .. || return 1
  else
    git clone $_gitroot $_gitname || return 1
  fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

  rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build
}

package() {
	cd $srcdir/$_gitname-build
  $srcdir/$_gitname-build/install.sh $pkgdir || return 1
}
