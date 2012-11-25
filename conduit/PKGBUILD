# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=conduit
pkgver=0.3.17
pkgrel=9
pkgdesc="Synchronization for GNOME"
arch=('any')
url="http://live.gnome.org/Conduit"
license=('GPL')
depends=('python2-dbus>=0.80.0' 'pygoocanvas>=0.9.0' 'gstreamer0.10-python' 'python2-gconf' 'python2-pysqlite' 'python2-vobject' 'pywebkitgtk' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool>=0.35.0' 'gnome-doc-utils>=0.3.2')
optdepends=('python2-gdata: required for Google module'
            'python2-feedparser: required for Feed module'
            'python2-flickrapi: required for Flickr module'
            'libgpod: required for iPod module'
            'python-evolution: required for Evolution module'
            'python2-imaging: required for Facebook module'
            'python2-simplejson: required for Facebook module') 
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=(dfbc00490b0170f22eb6e73b893da40c48556d8982b8400484e19fa617f5f934)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-scrollkeeper \
              PYTHON=python2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
