# Contributor: Davide Lo Re <boyska@gmail.com>
pkgname=easygit
pkgver=1.7.3
pkgrel=1
pkgdesc="Easy GIT is wrapper script for git, designed to make git easy to learn and use."
arch=(any)
url="http://people.gnome.org/~newren/eg/"
license=('GPL')
depends=('git' 'perl')
source=("http://people.gnome.org/~newren/eg/download/${pkgver}/eg")
sha256sums=('54949964f987a9d60e88f6ec2dbf79ca0595a09bcd96e52068e43533c2c569e0')

build() {
  cd "$srcdir/"
  install -D eg $pkgdir/usr/bin/eg
}

# vim:set ts=2 sw=2 et:
