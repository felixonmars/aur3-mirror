# Maintainer: Damian Nowak <damian.nowak@pacmanvps.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname='ejabberd-mod_admin_extra-svn'
pkgver='1107'
pkgrel='2'
pkgdesc='Additional commands for ejabberdctl'
arch=(any)
url='http://www.ejabberd.im/mod_admin_extra'
license=('GPL')
depends=('ejabberd')
makedepends=(erlang-nox subversion)
options=()

_svntrunk='https://svn.process-one.net/ejabberd-modules'
_svnmod='ejabberd-modules'
md5sums=()

package() {
  cd "$srcdir"

  if [ -d "${_svnmod}"/.svn ]; then
    (cd "${_svnmod}" && svn up -r "$pkgver")
  else
    svn co "${_svntrunk}" --config-dir ./ -r "$pkgver" "${_svnmod}"
  fi

  if [ -d "$srcdir"/"${_svnmod}"-build ]; then
    rm -r "$srcdir"/"${_svnmod}"-build
  fi

  cp -r "${_svnmod}" "${_svnmod}"-build
  cd "${_svnmod}"-build


  cd mod_admin_extra/trunk
  ./build.sh
  rm -rf ebin/.svn
  install -d -m 0755 "$pkgdir"/usr/lib/ejabberd
  cp -r ebin "$pkgdir"/usr/lib/ejabberd/ebin
}
