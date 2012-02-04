# Maintainer: TDY <tdy@gmx.com>

pkgname=gbirthday-git
pkgver=20091121
pkgrel=1
pkgdesc="A birthday reminder for Evolution/Thunderbird/Lightning/Sunbird contacts and MySQL databases"
arch=('i686' 'x86_64')
url="http://gbirthday.sourceforge.net/"
license=('GPL')
depends=('pygtk' 'python-bsddb')
makedepends=('git' 'intltool')
optdepends=('evolution:    Evolution contact support'
            'lightning:    Lightning event support'
            'mysql-python: MySQL database support'
            'thunderbird:  Thunderbird event support'
            'sunbird:      Sunbird event support')

_gitroot=git://gbirthday.git.sourceforge.net/gitroot/gbirthday/gbirthday
_gitname=gbirthday

build() {
  cd "$srcdir"

  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
  else
    git clone $_gitroot
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install || return 1
}
