pkgname=gnome-shell-extension-cpu-temperature-git
pkgver=20110623
pkgrel=1
pkgdesc="Gnome Shell Extensions that adds an applet on the panel which reveals current CPU temperature in Degree Celsius and Fahrenheit."
arch=('any')
url="https://github.com/xtranophilist/gnome-shell-extension-cpu-temperature"
license=('GPL')
depends=('gnome-shell')

_gitroot="https://github.com/xtranophilist/gnome-shell-extension-cpu-temperature.git"
_gitname="gnome-shell-extension-cpu-temperature"

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

  cd "$srcdir/$_gitname"

  mkdir -p $pkgdir/usr/share/gnome-shell/extensions/temperature@xtranophilist
  cp -r * $pkgdir/usr/share/gnome-shell/extensions/temperature@xtranophilist || return 1
}