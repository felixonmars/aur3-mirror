# Contributor : graysky <graysky AT archlinux DOT us>
# Contributor : tomk
pkgname=flexget-working
_pkgname=FlexGet
pkgdesc="An automation tool for content like torrents, podcasts, etc. that uses RSS-feeds, html, and even csv files.)"
pkgver=1.0r1650
pkgrel=1
arch=('any')
url="http://flexget.com/"
license=('MIT')
depends=('python2' 'python2-distribute' 'python-yaml' 'python-feedparser' 'python-progressbar' 'pynzb' 'pyrss2gen' 'python-html5lib' 'beautiful-soup' 'python2-sqlalchemy')
options=(!emptydirs)
install=(readme.install)
source=(http://download.flexget.com/unstable/${_pkgname}-${pkgver}.tar.gz config.yml)

package() {
  cd $srcdir/${_pkgname}-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -D $srcdir/config.yml $pkgdir/usr/share/flexget/config.yml
}
sha256sums=('423018917e6516c8815668aedaecb5e331f32130d2705627802c01bec9950762'
            '241873e369418e669ef3d4a10d9af07fc7e8c5434c50f597ee00308f33e5b266')
