# Contributor: IgnorantGuru <ignorantguru@gmx.com>
pkgname=devmon-git
pkgver=20120316
pkgrel=1
pkgdesc="An automounter for removable drives - Git version"
url="https://github.com/IgnorantGuru/devmon"
arch=(any)
license=('GPL3')
depends=('udisks<1.9' 'bash>=4')
optdepends=('consolekit: for udisks polkit permissions'
            'zenity: for pop-up dialogs')
conflicts=('devmon')

_gitroot="git://github.com/IgnorantGuru/devmon.git"
_gitname="devmon"

build() {
  msg "Connecting to GIT server...."

  if [ -d $_gitname ]; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone --depth=1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  install -Dm755 $_gitname/$_gitname "$pkgdir/usr/bin/$_gitname"
}

