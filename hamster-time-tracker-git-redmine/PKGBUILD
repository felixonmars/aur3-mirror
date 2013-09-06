# $Id: PKGBUILD 82942 2013-01-26 01:37:20Z bgyorgy $
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Georg Vogetseder <georg.vogetseder@gmail.com>
# Contributor (Redmine Integration): Piotr Żurek (Sology) <piotr at sology dot eu>

pkgname=hamster-time-tracker-git-redmine
pkgver=20130906
pkgrel=1
pkgdesc="Time tracking application that helps you to keep track on how much time you have spent during the day on activities you choose to track - contains simple integration with Redmine' s Time Entries"
arch=('any')
url="http://projecthamster.wordpress.com/"
license=('GPL')
depends=('python2-dbus' 'python2-gconf' 'python2-notify' 'python2-wnck' 'python2-xdg' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool' 'gnome-doc-utils' 'git')
provides=('hamster-applet' 'hamster-time-tracker')
conflicts=('hamster-applet' 'hamster-time-tracker')
install=$pkgname.install
md5sums=('SKIP')

_gitroot="https://github.com/Sology/hamster.git"
_gitname="hamster"

pkgver() {
	date +%Y%m%d
}

build() {
  cd "$srcdir"
	msg "Connecting to GIT server..."

	if [ -d $_gitname ] ; then
  	cd $_gitname && git pull origin
		msg "The local files are updated."
		cd ..
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"

	cd "$_gitname"

  # Python2 fix
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

	msg "Starting waf configure..."

  python2 ./waf configure --prefix=/usr

	msg "Starting waf build..."

  python2 ./waf build
}

package() {
	cd "$srcdir"
  cd "$_gitname"

  python2 ./waf install --destdir=$pkgdir

  # Move bash completion and GConf schema to it's correct place
  install -dm755 "$pkgdir/usr/share/bash-completion/completions"
  mv "$pkgdir/etc/bash_completion.d/hamster.bash" "$pkgdir/usr/share/bash-completion/completions/hamster"
  mv "$pkgdir/etc/gconf" "$pkgdir/usr/share"
  rm -r "$pkgdir/etc"
}
