# Maintainer: OK100 <ok100.ok100.ok100@gmail.com>

pkgname=opera-standard-skin-netbook-git
pkgver=20111211
pkgrel=1
pkgdesc="Default Featherweight skin for Opera 11+. Compact version for netbooks."
arch=(any)
url="http://www.opera.com/"
license=('custom:opera')
depends=('opera')
makedepends=('git' 'zip')

_gitroot="git://github.com/ok100/opera-standard-skin-netbook.git"
_gitname="opera-standard-skin-netbook"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  zip -r $_gitname.zip *
  install -m644 -D $_gitname.zip $pkgdir/usr/share/opera/skin/$_gitname.zip
}
