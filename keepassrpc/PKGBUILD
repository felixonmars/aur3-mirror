# $Id: PKGBUILD 105730 2014-02-14 15:33:41Z tredaelli $
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Kirill "reflexing" Churin <reflexing@reflexing.ru>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=keepassrpc
pkgver=1.4.1
pkgrel=1
pkgdesc='KeePassRPC extracted from KeeFox addon'
arch=('any')
url='http://keefox.org/'
license=('GPL')
depends=('keepass')
#optdepends=('xdotool: if you want to use auto-type'
#            'xsel: clipboard operations in order to work around Mono clipboard bugs')
#install="$pkgname.install"
#source=("https://addons.cdn.mozilla.net/storage/public-staging/306880/keefox-$pkgver-fx+tb-linux.xpi")
source=("https://github.com/luckyrat/KeeFox/raw/v${pkgver}/XPI-package/latest.xpi")

sha256sums=('c2fb176ed8cc44cc34225570c5624e9a0ebb2d60c54b96c3d6a80c89945eaf5b')

#prepare() {
#  # Extract icons
#  icotool -x KeePass/KeePass.ico
#
#  pushd Build &>/dev/null
#  bash PrepMonoDev.sh
#  popd &>/dev/null
#
#  # FIXME Right alignment doesn't work correctly (truncated text).
#  sed -i 's/^\(\s*\S*\.TextAlign\s*=\s*System\.Windows\.Forms\.HorizontalAlignment\).Right\(;\s*\)$/\1.Left\2/g' \
#    KeePass/Forms/*.Designer.cs
#}

#build() {
#}

package() {
  install -dm755 "$pkgdir"/usr/share/keepass/plugins
  install -Dm755 deps/KeePassRPC.plgx "$pkgdir"/usr/share/keepass/plugins/KeePassRPC.plgx
}
