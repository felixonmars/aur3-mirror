# Contributor: senorsmile <senorsmile [at] gmail [dot] com>
# Contributor: Jonathan Ryan <jryan@curious-computing.com>
# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=bitpocket-git
pkgver=a1c6dad430
_last_updated_date="2014-03-18"
pkgrel=1
pkgdesc="DIY Dropbox or 2-way directory (r)sync with proper deletion - Git version"
arch=('any')
url="http://ku1ik.com/2011/07/18/bitpocket-as-a-dropbox-alternative.html"
license=('custom')
depends=('rsync' 'bash')
makedepends=('git')

source=("git+https://github.com/sickill/bitpocket.git#commit=${pkgver}")
md5sums=('SKIP')

_gitroot="https://github.com/sickill/bitpocket.git"
_gitname="bitpocket"

build() {
  cd "${srcdir}"
  #msg "Connecting to Git server...."

#  if [ -d ${_gitname}/.git ] ; then
#    cd "${_gitname}"
#
#    git pull origin
#    msg "The local files are updated."
#  else
#    git clone "${_gitroot}" "${_gitname}"
#  fi

  ls -alh

  msg "Git checkout done or server timeout"
}

package() {
  #cd "${srcdir}/${_gitname}"
  cd "${srcdir}/bitpocket"
  install -Dm0755 bin/bitpocket "${pkgdir}/usr/bin/bitpocket"
  install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
