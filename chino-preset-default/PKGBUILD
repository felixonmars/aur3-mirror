# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
pkgname=chino-preset-default
pkgver=0.20
pkgrel=1
pkgdesc="example preset for chino"
arch=('any')
url="http://chino.tuxfamily.org/"
license=('custom: mixed/public_domain')
depends=('chino')
optdepends=('ams' 'amsynth' 'ardour' 'drumkv1' 'dssi' \
  'gjacktransport' 'gjvidtimeline-svn' 'xjadeo' \
  'inconcert-git' 'jaaa' 'jack-rack' 'japa' 'jconvolver' \
  'jnoisemeter' 'laborejo' 'nekobee' 'non-sequencer-git' \
  'non-daw' 'pd-extended' 'phasex-dev' 'qmidiarp' 'qsynth' \
  'seq24' 'samplv1' 'setbfree' 'synthv1' 'tapeutape' \
  'tranches' 'whysynth' 'yass' 'yoshimi' 'zita-rev1')
source=(http://download.tuxfamily.org/chino/$pkgname-$pkgver.tar.bz2)
md5sums=('e984d99400c915248543180cada1d099')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
