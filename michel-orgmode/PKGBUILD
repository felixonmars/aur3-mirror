# Maintainer: Christophe-Marie Duquesne <chmd@chmd.fr>

pkgname=michel-orgmode
pkgdesc="push/pull org-mode textfiles to gtasks"
url="https://bitbucket.org/edgimar/michel-orgmode"
depends=(
    'python2-google-api-python-client'
    'python2-gflags'
    'python2-httplib2'
    'pyxdg'
    'python2-oauth2')
optdepends=('diffutils: syncing support')
makedepends=('python2-distribute' 'mercurial')
provides=('michel-orgmode')
license=('Public Domain')
arch=('any')
pkgver=0.r59.1e379f730fe5
pkgrel=1
source=("$pkgname"::'hg+https://bitbucket.org/edgimar/michel-orgmode')
md5sums=('SKIP')

#_hgroot='https://bitbucket.org/edgimar/michel-orgmode'
#_hgrepo='michel-orgmode'

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
  chmod +r ${pkgdir}/* -R
}
