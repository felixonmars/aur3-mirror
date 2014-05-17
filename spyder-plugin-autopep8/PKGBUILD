# Maintainer: David Verelst <david.verest -at- gmail com>
pkgname=spyder-plugin-autopep8
_gitname=spyder_autopep8
pkgver=55.49a80b9
pkgrel=1
pkgdesc="A plugin to run the autopep8 python linter from within spyder editor"
arch=(any)
url="https://github.com/Nodd/spyder_autopep8"
license=('MIT')
depends=('python2' 'spyder' 'python2-autopep8')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=('git://github.com/Nodd/spyder_autopep8.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  #git describe --always | sed 's|-|.|g'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
   cd $_gitname
   python2 -m compileall import p_autopep8.py
   install -Dm644 p_autopep8.py "$pkgdir"/usr/lib/python2.7/site-packages/spyderplugins/p_autopep8.py
   install -Dm644 p_autopep8.pyc "$pkgdir"/usr/lib/python2.7/site-packages/spyderplugins/p_autopep8.pyc
   install -Dm644 images/autopep8.png "$pkgdir"/usr/lib/python2.7/site-packages/spyderplugins/images/autopep8.png
}
