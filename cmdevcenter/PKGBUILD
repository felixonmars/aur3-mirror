# Mantainer: mrlithid <mrlithid@gmail.com>
pkgname=cmdevcenter
pkgver=20130430
pkgrel=2
pkgdesc="CyanogenMod Dev Center, GUI Wrapper to compile/manage cyanogenmod repositories."
arch=('i686' 'x86_64')
url="https://github.com/lithid/CMDevCenter"
license=('GPL3')
depends=('gtk3' 'python2-gobject' 'pygtk')
makedepends=('git')

_gitroot="https://github.com/lithid/CMDevCenter.git"
_gitname="CMDevCenter"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files were updated."
  else
    git clone $_gitroot $_gitname
    if [ -d $_gitname ]; then
		msg "Git download complete"
	else
		msg "Git download error"
		msg "Nothing can be done"
		exit 1
    fi
  fi

  msg "Starting make..."
  dir=../../..
  rm -rf "$srcdir/$_gitname-build"
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir -p $pkgdir/usr/share/$pkgname/scripts/
  mkdir -p $pkgdir/usr/share/$pkgname/CLocale/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/man/man7/
  mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/apps/
  
  cp -r cmdevcenter $pkgdir/usr/bin/
  cp -r desktop/* $pkgdir/usr/share/applications/
  cp -r cmdevcenter.png $pkgdir/usr/share/icons/
  cp -r images/* $pkgdir/usr/share/$pkgname/
  cp -r scripts/* $pkgdir/usr/share/$pkgname/scripts/
  cp -r Helper.py $pkgdir/usr/share/$pkgname/
  cp -r CLocale/* $pkgdir/usr/share/$pkgname/CLocale/
  cp -r layout.glade $pkgdir/usr/share/$pkgname/

  rm -rf "$srcdir/$_gitname-build"
}
