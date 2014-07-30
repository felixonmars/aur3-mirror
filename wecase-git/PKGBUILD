# Maintainer: Tom Li <biergaizi@member.fsf.org>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=wecase-git
pkgver=0
pkgrel=1
pkgdesc="A Sina Weibo Client Focusing on Linux"
arch=('any')
url="https://github.com/WeCase/WeCase"
license=('GPL3')
depends=('python>=3' 'pyqt>=4' 'python-notify2' 'python-rpweibo-git')
makedepends=('git')
provides=('wecase')
conflicts=('wecase')
source=('WeCase::git://github.com/WeCase/WeCase.git')
md5sums=('SKIP')

_gitbranch="dev-0.06"

pkgver() {
  cd "$srcdir/WeCase"
  git checkout "$_gitbranch" > /dev/null 2>&1
  git describe --always | sed 's|-|.|g' 
}

build() {
  cd "$srcdir/WeCase"
  git checkout "$_gitbranch"
  ./bootstrap.sh
  ./configure --prefix=/usr libexecdir=/usr/lib/wecase
  make
}

package() {
  export LANG=en_US.UTF-8
  cd "$srcdir/WeCase"
  make DESTDIR="$pkgdir/" install
}
