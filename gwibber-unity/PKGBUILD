# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=gwibber-unity
_pkgname=gwibber
pkgver=3.3.2
pkgrel=1
pkgdesc="Microblogging client for GNOME, which supports Twitter, Identi.ca, StatusNet, Facebook, Flickr, Digg, FriendFeed and Qaiku with Unity integration"
arch=(i686 x86_64)
url="http://gwibber.com/"
license=(GPL)
depends=(gtkspell3 json-glib 'libunity>=5.0.0' dbus-python gnome-keyring python-gnomekeyring python-notify python-wnck python-egenix-mx-base python2-oauth python-imaging python-pycurl python-simplejson pywebkitgtk pyxdg xdg-utils)
makedepends=('vala>=0.14' 'intltool>=0.35.0' 'gobject-introspection>=0.10')
optdepends=('libindicate: Messages Indicator support')
provides=("gwibber=$pkgver")
conflicts=(gwibber)
options=(!libtool)
install=$_pkgname.install
source=(http://launchpad.net/$_pkgname/3.4/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('47a15990fb3b27bc1ef6b953b9b26022')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  # Fix lens icon path
  sed -i 's|Icon=applications-microblogging-panel|Icon=/usr/share/gwibber/unity/applications-microblogging-panel.svg|' lens/data/gwibber.lens.in.in

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgname \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
