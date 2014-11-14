# Maintainer: Michail Bitzes <noodlylight@gmail.com>
pkgname=fusilli-git
pkgver=0.0.0.r27.g0f1de2a
pkgrel=3
pkgdesc="Fusilli Window Manager (Compiz fork)"
arch=('i686' 'x86_64')
url="https://github.com/noodlylight/fusilli"
license=('GPL' 'LGPL' 'MIT')
install="fusilli.install"

depends=('libxrender' 'libxrandr' 'libxinerama' 'libxcomposite' 'libsm'
         'libgl' 'glu'
         'glib2' 'libwnck'
         'cairo' 'pango' 'librsvg'
         'libpng' 'libjpeg-turbo'
         'libxml2' 'libxslt'
         'python2' 'pygtk'
         'startup-notification'
         'desktop-file-utils')
makedepends=('intltool' 'git')
optdepends=(
  'marco: for metacity theme support/integration with marco (need to rebuild this package)'
)

source=("$pkgname::git+https://github.com/noodlylight/fusilli.git")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh \
        --prefix=/usr \
        --disable-kde4
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install

    install -Dm644 "$srcdir/$pkgname"/COPYING.MIT "$pkgdir"/usr/share/licenses/$pkgname/COPYING.MIT
}
