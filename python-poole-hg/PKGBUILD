# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Marco S <marcosiviero.mobile@gmail.com>
# Contributer: Paul Barker <paul@paulbarker.me.uk>

_pkgbase=poole
pkgname=python-$_pkgbase-hg
pkgver=r193.bcb7f8170b5e
pkgrel=1
pkgdesc="A damn simple static website generator"
arch=('any')
url="https://bitbucket.org/obensonne/poole"
license=('GPL3')
conflicts=('python2-poole-hg')
depends=('python-markdown')
makedepends=('mercurial')
source=($_pkgbase::"hg+$url#branch=py3")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  # patch theme directory
  sed "s|opj(HERE, 'themes')|'/usr/share/$_pkgbase/themes'|" \
    -i $_pkgbase/$_pkgbase.py
}

package() {
  install -Dm755 $_pkgbase/$_pkgbase.py "$pkgdir"/usr/bin/$_pkgbase
  install -d "$pkgdir"/usr/share/$_pkgbase
  cp -r $_pkgbase/themes "$pkgdir"/usr/share/$_pkgbase
}
