# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=advene
pkgver=1.0
pkgrel=1
pkgdesc="Share, edit and visualize hypervideos."
arch=(any)
url="http://liris.cnrs.fr/advene/index.html"
license=('GPL')
depends=('pygtk' 'python2-cherrypy' 'python2-simpletal' 'gstreamer0.10-python'
         'gstreamer0.10-base-plugins' 'desktop-file-utils')
optdepends=('gstreamer0.10-good-plugins: good codecs support'
            'gstreamer0.10-bad-plugins: bad codecs support'
            'gstreamer0.10-ugly-plugins: ugly codecs support')
install="$pkgname.install"
source=("http://download.gna.org/advene/sources/$pkgname-$pkgver.tgz"
        "advene.desktop::http://svn.gna.org/viewcvs/*checkout*/advene/debian/advene.desktop?revision=7138&pathrev=7156")
md5sums=('e7c93c4398509c5aec6b47c9b53cb9f6'
         'e6cfebe91cf3b7778ee68127b952babd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # place desktop file in the right dir
  mkdir debian && cp ../$pkgname.desktop debian

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/"

  # python2 fixes
  sed -i "s|bin/python|&2|" \
    `grep -rl bin/python "$pkgdir/usr/lib"`
}

# vim:set ts=2 sw=2 et:
