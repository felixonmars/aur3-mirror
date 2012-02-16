# Mantainer: Filippo Squillace <sqoox85 at gmail.com>
pkgname=emacs-for-python
pkgver=0.3
pkgrel=1
pkgdesc="Collection of emacs extensions specifically collected for python development, with workflow guidelines!"
arch=(any)
url="http://gabrielelanaro.github.com/emacs-for-python"
license=('GPLv3')
depends=('emacs' 'python2-pyflakes' 'pymacs')
makedepends=()
provides=()
options=()
source=(https://github.com/downloads/gabrielelanaro/${pkgname}/${pkgname}-${pkgver}.tar.gz)

md5sums=('6c2d37479ecf64d93dc462c2e455f285')
optdepends=()
install=epy.install

build() {
  cd ${pkgname}-${pkgver}

  echo "Moving the licence into /usr/share/licenses/${pkgname} ..."
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  mv -f "COPYING" $pkgdir/usr/share/licenses/${pkgname}/

  echo "Copying the $pkgname directory into the pkg directory ..."
  mkdir -p "$pkgdir/usr/share/emacs/site-lisp/${pkgname}"
  cp -rf * "$pkgdir/usr/share/emacs/site-lisp/$pkgname/"

}

# vim:set ts=2 sw=2 et:
