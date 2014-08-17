# Maintainer: Bobby Burden <bobby@brb3.org>
pkgname=modman
pkgver=1.9.9
pkgrel=1
pkgdesc="Module deployment script geared towards Magento development with git and svn."
url="https://github.com/colinmollenhour/modman"
arch=any
license=('Apache')
depends=('bash')
optdepends=(
  'git: Provides support for loading modules from Git repositories'
  'svn: Provides support for loading modules from SVN repositories'
  'bash-completion: Adds tab-completion for modman commands'
)
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("https://github.com/colinmollenhour/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8dfec366f63554b50f8cf0f36d2131202cf22da04631700844fb6cf5853fdfc7')

build() {
  cd "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 modman "$pkgdir/usr/bin/modman"
  install -Dm644 bash_completion "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
}

# vim:set ts=2 sw=2 et:
