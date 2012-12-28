# Maintainer: Tom Vincent <http://tlvince.com/contact>
_pkgname=sms-gammu2android
pkgname=$_pkgname-git
pkgver=20121228
pkgrel=1
pkgdesc="Gammu to Android SMS converter"
arch=(any)
url="http://blog.ginkel.com/2009/12/transferring-sms-from-nokia-to-android/"
license=('GPL')
depends=('perl' 'perl-timedate')
makedepends=('git')

_gitroot=https://github.com/tlvince/$_pkgname.git
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
  msg "Starting build..."

}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 $_pkgname.pl $pkgdir/usr/bin/$_pkgname
}
