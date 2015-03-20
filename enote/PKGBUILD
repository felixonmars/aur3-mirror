# Maintainer: Troels Jacobsen <tkjacobsen@gmail.com>
pkgname=enote
pkgver=0.0.2
pkgrel=1
pkgdesc='Command line utility to backup Evernote notes and notebooks'
arch=(any)
url="https://github.com/tkjacobsen/$pkgname"
license=('MIT')
depends=('evernote-sdk-python-git'
         'python2-oauth2'
         'python2-beautifulsoup4'
         'python2-html2text-git')
#makedepends=()
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('b81a5113832318ddf3124472d9dda6953959157edbfbd1cf4463c470217de7ed')

package() {
	cd "$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/"
}

