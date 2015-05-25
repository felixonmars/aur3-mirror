# Maintainer: Joe Harrison <joehazzers@gmail.com>
pkgname=vaultproject
pkgver=0.1.2
pkgrel=1
pkgdesc="A tool for managing secrets."
arch=('i686' 'x86_64')
url="https://www.vaultproject.io/"
license=('custom:MPLv2')
depends=('glibc')
source=("LICENSE")
source_i686=("https://dl.bintray.com/mitchellh/vault/vault_${pkgver}_linux_386.zip")
source_x86_64=("https://dl.bintray.com/mitchellh/vault/vault_${pkgver}_linux_amd64.zip")
sha256sums=('60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d')
sha256sums_i686=('20cf0fb7df3fb451bfd80ef7d14a7884d17e1a04b15ebdd3030d046d07d71b5a')
sha256sums_x86_64=('12c28cf7d6b6052c24817072fb95d4cfa2a391b507c705e960faf11afb5ee6ad')

package() {
  install -m755 -D vault "$pkgdir/usr/bin/vault"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/vaultproject/LICENSE"
}
