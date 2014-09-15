# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: wido <widowild [at] myopera [dot] com>

pkgname=('sat-xmpp' 'sat-jp' 'sat-primitivus' 'sat-wix' 'sat_media')
_realname=sat
_medianame=sat_media
pkgver=0.5.0
pkgrel=2
url="http://salut-a-toi.org/"
arch=('any')
makedepends=('python2-setuptools')
license=('AGPL3')
source=("ftp://ftp.goffi.org/$_realname/$_realname-${pkgver}.tar.bz2"
        "ftp://ftp.goffi.org/$_medianame/$_medianame-${pkgver}.tar.bz2")
md5sums=('9907beb249c8e11a880e2c5d5268faa0'
         '381e6fd079c5964757a36480648097e3')
options=('!strip')

build() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py build

  install -dm755 "$srcdir/fakeinstall/"
  SAT_INSTALL=nopreinstall python2 setup.py install --root="$srcdir/fakeinstall/" --prefix=/usr --optimize=1
}

package_sat-xmpp(){
  pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (core)"
  depends=('python2-dbus' 'python2-lxml' 'mutagen' 'python2-imaging' 'pyfeed' 'twisted' 'python2-wokkel' 'xe' 'python2-zope-interface')

  cd "$pkgdir"
  install -dm755 usr/bin/
  install -dm755 usr/lib/python2.7/site-packages/

  cd "$srcdir/fakeinstall"
  mv -v usr/bin/sat "$pkgdir/usr/bin/"
  mv -v usr/share/ "$pkgdir/usr/"
  mv -v usr/lib/python2.7/site-packages/sat/ "$pkgdir/usr/lib/python2.7/site-packages/"
  mv -v usr/lib/python2.7/site-packages/twisted/ "$pkgdir/usr/lib/python2.7/site-packages/"
  mv -v usr/lib/python2.7/site-packages/sat-0.5.0-py2.7.egg-info/ "$pkgdir/usr/lib/python2.7/site-packages/"
  for i in bridge constants.py* __init__.py* quick_frontend tools; do
    mv -v "usr/lib/python2.7/site-packages/sat_frontends"/$i "$pkgdir/usr/lib/python2.7/site-packages/sat_frontends/"
  done
}

package_sat-jp(){
  pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (CLI frontend)"
  depends=('sat-xmpp' 'python2-gobject')
  optdepends=('python2-progressbar: to get nice progress bars')

  cd "$pkgdir"
  install -dm755 usr/bin/
  install -dm755 usr/lib/python2.7/site-packages/sat_frontends/

  cd "$srcdir/fakeinstall"
  mv -v usr/bin/jp "$pkgdir/usr/bin/"
  mv -v usr/lib/python2.7/site-packages/sat_frontends/jp/ "$pkgdir/usr/lib/python2.7/site-packages/sat_frontends/"
}

package_sat-primitivus(){
  pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (ncurses frontend)"
  depends=('sat-xmpp' 'python2-gobject' 'python2-urwid-satext')

  cd "$pkgdir"
  install -dm755 usr/bin/
  install -dm755 usr/lib/python2.7/site-packages/sat_frontends/

  cd "$srcdir/fakeinstall"
  mv -v usr/bin/primitivus "$pkgdir/usr/bin/"
  mv -v usr/lib/python2.7/site-packages/sat_frontends/primitivus/ "$pkgdir/usr/lib/python2.7/site-packages/sat_frontends/"
}

package_sat-wix(){
  pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (wx frontend)"
  depends=('sat-xmpp' 'wxpython' 'sat_media')

  cd "$pkgdir"
  install -dm755 usr/bin/
  install -dm755 usr/lib/python2.7/site-packages/sat_frontends/

  cd "$srcdir/fakeinstall"
  mv -v usr/bin/wix "$pkgdir/usr/bin/"
  mv -v usr/lib/python2.7/site-packages/sat_frontends/wix/ "$pkgdir/usr/lib/python2.7/site-packages/sat_frontends/"
}

package_sat_media(){
  pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (media files)"

  cd "$pkgdir"
  install -dm755 usr/share/sat/media/

  cd "$srcdir/$_medianame-$pkgver"
  cp -r * "$pkgdir/usr/share/sat/media/"
}
