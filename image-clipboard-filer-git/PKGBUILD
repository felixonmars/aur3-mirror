# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=image-clipboard-filer-git
_pkgname=imageClipboardFiler
pkgver=r15.2ee925a
pkgrel=1
pkgdesc="Python script that saves an image from clipboard to a file"
arch=('any')
url="https://github.com/orschiro/scriptlets/tree/master/ImageClipboardFiler"
license=('GPL2')
depends=('python2' 'pygtk')
makedepends=('git')
source=("$pkgname"::'git://github.com/orschiro/scriptlets.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname/ImageClipboardFiler"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    sed -i 's/python/python2/g' "$srcdir/$pkgname/ImageClipboardFiler/$_pkgname.py"
}

package() {
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/ImageClipboardFiler/$_pkgname.py" "$pkgdir/usr/bin/$_pkgname"
}

