# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=advene
pkgver=0.46
pkgrel=2
pkgdesc="Share, edit and visualize hypervideos."
arch=(any)
url="http://liris.cnrs.fr/advene/index.html"
license=('GPL')
depends=('pygtk' 'python2-cherrypy' 'python2-simpletal' 'gstreamer0.10-python' 'gstreamer0.10-base-plugins')
optdepends=('gstreamer0.10-good-plugins: good codecs support'
            'gstreamer0.10-bad-plugins: bad codecs support'
            'gstreamer0.10-ugly-plugins: ugly codecs support')
install="$pkgname.install"
source=("http://download.gna.org/advene/sources/$pkgname-$pkgver.tgz"
        "advene.desktop::http://svn.gna.org/viewcvs/*checkout*/advene/debian/advene.desktop?revision=7138&pathrev=7156")
md5sums=('d3216a9489d432e59a262a3a20ea58ab'
         'e6cfebe91cf3b7778ee68127b952babd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # place desktop file in the right dir
  mkdir debian && cp ../$pkgname.desktop debian

  # python2 fixes
  sed -i "s|\(env python\).*|\12|;s|\(bin/python\).*|\12|" \
         `grep -Erl "(env python|bin/python)" .`

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
