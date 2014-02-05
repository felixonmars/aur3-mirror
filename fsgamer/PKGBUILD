# Maintainer: Charles Banas <greyfade@gmail.com>
pkgname=fsgamer
pkgver=0.1.2
pkgrel=1
pkgdesc="A utility which improves fullscreen gaming on Linux"
arch=('any')
url="http://michaelb.org/projects/fsgamer/"
license=('GPL3')
install='fsgamer.install'
makedepends=('python2-distutils-extra')
depends=('python2' 'python2-xdg' 'openbox' 'python2-xlib' 'launchpadlib' 'gobject-introspection' 'dconf')
optdepends=('espeak: text-to-speech notifications')
provides=('fsgamer')
options=(!emptydirs)
source=("https://bitbucket.org/michaelb/fsgamer/downloads/fsgamer_${pkgver}.tar.gz")
md5sums=('a1faae192c83792fdad69319423454cb')
sha1sums=('fc80e8f4d3c12bea77e0101e3a253c029e46f5c2')

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
