# Maintainer: me

pkgname=htpcmanager-git
_gitname=HTPC-Manager
pkgver=afff135
pkgrel=3
pkgdesc="Manage your Htpc from everywhere"
arch=('any')
url="http://htpc.io/"
license=('GPL3')
depends=('python2' 'python2-pillow')
makedepends=('git')
install='htpcmanager.install'
source=('git://github.com/styxit/HTPC-Manager.git' 'htpcmanager.service' 'htpcmanager.install')

md5sums=('SKIP'
         'c32fb2aad230f6fa660b1e776de9d299'
         'c32603dfa153a435c22eaaa264183d65')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -r "$srcdir/$_gitname" "${pkgdir}/opt/htpcmanager"

  install -Dm644 "${srcdir}/htpcmanager.service" "${pkgdir}/usr/lib/systemd/system/htpcmanager.service"
}
