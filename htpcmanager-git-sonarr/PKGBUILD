# Maintainer: me

pkgname=htpcmanager-git-sonarr
_gitname=HTPC-Manager
pkgver=2e246db
pkgrel=2
pkgdesc="Manage your Htpc from everywhere"
arch=('any')
url="https://github.com/Hellowlol/HTPC-Manager"
license=('GPL3')
depends=('python2' 'python2-pillow')
optdepends=('python2-psutil')
makedepends=('git')
conflicts=('htpcmanager-git')
install='htpcmanager.install'
source=('git://github.com/Hellowlol/HTPC-Manager.git' 'htpcmanager.service' 'htpcmanager.install' 'htpcmanager.tmpfiles')

md5sums=('SKIP'
         'c32fb2aad230f6fa660b1e776de9d299'
         'c32603dfa153a435c22eaaa264183d65'
         '6164500cc38cc73a990b7c5e3d0dc1a3')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -r "$srcdir/$_gitname" "${pkgdir}/opt/htpcmanager"

  install -Dm644 "${srcdir}/htpcmanager.service" "${pkgdir}/usr/lib/systemd/system/htpcmanager.service"
  install -Dm644 "${srcdir}/htpcmanager.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/htpcmanager.conf"
}
