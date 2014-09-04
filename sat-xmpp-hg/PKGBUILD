# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: wido <widowild [at] myopera [dot] com>

pkgname=sat-xmpp-hg
_realname=sat
pkgver=1154
pkgrel=1
pkgdesc="a Client XMPP Jabber"
url="http://sat.goffi.org/"
arch=('any')
depends=('python2-wokkel-hg' 'python2-imaging' 'python2-dbus' 'pyfeed')
optdepends=('python2-gobject2: for the jp frontend'
            'python2-progressbar: for the jp frontend'
            'python2-urwid-satext: for the primitivus frontend'
            'wxpython: for the wix frontend')
makedepends=('mercurial')
provides=('sat-xmpp=0.4')
conflicts=('sat-xmpp')
license=('AGPL3')

source=('hg+http://repos.goffi.org/sat')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_realname"
  hg identify -n
}

build() {
  cd "$srcdir/$_realname"
  python2 setup.py build
}

package(){
  cd "$srcdir/$_realname"
  SAT_INSTALL=nopreinstall python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
