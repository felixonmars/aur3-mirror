# Maintainer: OS Hazard  <oshazard+aur@gmail.com>
pkgname='gedit-multi-edit'
_gitname='gedit-multi-edit'
pkgver=20091017
pkgrel=2
pkgdesc="gedit2 plugin for column editing and multiple edit points"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/jessevdk/2009/11/15/new-gedit-plugin-multi-edit/"
_gitroot='https://github.com/jessevdk/gedit-multi-edit.git'
install="gedit-multi-edit.install"
license=('GPL')
depends=('gedit')
makedepends=('git')

package() {
  cd $srcdir
  msg "Connecting to GitHub ...."

  if [[ -d $_gitname ]]; then
    cd $_gitname
    git pull origin || return 1
    msg "Local checkout updated or server timeout"
    cd ..
  else
    git clone --depth=1 $_gitroot
    cd $_gitname
    msg "Checkout done or server timeout"
  fi

  msg "Packaging..."
  cd "$srcdir/$_gitname/plugin"

  install -d "$pkgdir/usr/lib/gedit-2/plugins/multiedit"
  install -m644 -t "$pkgdir/usr/lib/gedit-2/plugins/multiedit/" \
    multiedit/*
  install -m644 multiedit.gedit-plugin \
    "$pkgdir/usr/lib/gedit-2/plugins/"
}

