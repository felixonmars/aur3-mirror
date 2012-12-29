# Maintainer: Snowball <excitablesnowball@gmail.com>
pkgname=python2-remix
pkgver=2.0.1
pkgrel=1
pkgdesc="Echo Nest Remix is the Internet Synthesizer. Make things with music."
arch=(any)
url="http://echonest.github.com/remix/python.html"
license=('New BSD')
groups=()
depends=('python2' 'python2-numpy' 'ffmpeg')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/r/remix/remix-2.0.1.tar.gz")
noextract=()
md5sums=('444b25bff4021c54f1136e0b0b9f706b')

package() {
  cd "$srcdir/remix-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/local/bin"
  ln -s `which ffmpeg` "$pkgdir/usr/local/bin/en-ffmpeg"
}

# vim:set ts=2 sw=2 et:
