# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=nautilus-columns
pkgver=0.3
pkgrel=3
pkgdesc="A Nautilus extension to display music/EXIF metadata info in the Nautilus List View"
url="https://launchpad.net/~nilarimogard/+archive/webupd8/+packages?field.name_filter=nautilus-columns"
license=('GPL')
depends=('python-nautilus' 'mutagen' 'pyexiv2' 'kaa-metadata')
#perhaps enough for testing with nautilus2
# run:
#pacman -Rdd nautilus
# uncoment this:
#depends+=('nautilus2')
#provides=('nautilus')
source=(https://launchpad.net/~nilarimogard/+archive/webupd8/+files/${pkgname}_${pkgver}.orig.tar.gz
        python2.patch)
options=('!libtool')
arch=('i686' 'x86_64')
sha256sums=('2b0dad05092780f9c4c88f520c464b37aa24481c81cafad50cc547539028d376'
            '1bf1fd3345a44dde8bbcd8b08a11af3d4b9a6f5a611753ce629cabc2da526544')

build() {
  cd "$srcdir"

  # Python, oh python :/
  patch -Np0 -i python2.patch

  # Compiling script.. This isn't necessary but probably increase performance
  python2 -mcompileall "$srcdir/"

#old compiling method:
#python2 -c  '
#try: from py_compile import compile; compile("bsc-v2.py")
#except: pass' || true
}

package() {
  install -dm755 \
    "$pkgdir/usr/share/nautilus-python/extensions/"
  install -m755 \
    "$srcdir/bsc-v2.py"* \
    "$pkgdir/usr/share/nautilus-python/extensions/"
}
