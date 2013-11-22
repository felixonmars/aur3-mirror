#Author: Arne Ko arneko {a t} yahoo . com

pkgname=adafruit-raspberry-pi-python-code-git
pkgver=20131121
pkgrel=1
pkgdesc="adafruit-raspberry-pi-python-code. Files can be found in /usr/share/adafruit-raspberry-pi-python-code"
arch=('any')
url="https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code"
license=('MIT')
depends=()
makedepends=('git')

_gitroot="git://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code.git"
_gitname="master"
_futurefoldername="adafruit-raspberry-pi-python-code"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  git clone "$_gitroot" "$_gitname"

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  rm .git -rf
  cd ..
}

package() {
  #install -dm755 $pkgdir/usr/
  mkdir "$pkgdir/usr/"
	mkdir "$pkgdir/usr/share"	
  cp -r "$srcdir/$_gitname" "$pkgdir/usr/share/$_futurefoldername"
  #chmod 755 "$pkgdir/usr/share/arduino/libraries/$_futurefoldername" -R
}

