# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=cortex
pkgver=5.22.0
pkgrel=1
pkgdesc="A set of high quality C++ libraries and Python modules tailored for software development in the visual effects industry."
arch=(i686 x86_64)
url="http://cortex-vfx.googlecode.com/"
license=('custom')
depends=('freetype2' 'openexr' 'libtiff' 'boost-libs' 'python2')
makedepends=('scons')
conflicts=('cortex-git')
source=("${url}files/$pkgname-$pkgver.tar.gz")
md5sums=('5a39fad97fbba21d749d6891bac038ab')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Python2 fixes
  export PYTHON="python2"
  sed -i "s|\(env python2\)\..*|\1|" {scripts/do,config/ie/releaseAll}

  # A lot of scons configuration fixes
  sed -i \
	"s|/local||g;s|\(boost\)-1_34_1|\1|; \
	s|-\${BOOST.*VERSION}||;838,852d; \
	s|_thread|&-mt|;s|bin/python|&2|; \
	s|\(python\)\(-config\)|\12\2|g; \
	s|X/ops|X/lib/IECore/ops|" \
	SConstruct

  scons
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  scons INSTALL_PREFIX="$pkgdir/usr" install

  # Install License file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
