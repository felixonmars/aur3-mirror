# Maintainer: Louis R. Marascio <lrm@fitnr.com>

pkgname=git-publish-branch
pkgver=1.0
pkgrel=1
pkgdesc="A simple script to ease the unnecessarily complex task of publishing a git branch."
arch=('i686' 'x86_64')
url="http://git-wt-commit.rubyforge.org"
license=('GPL')
depends=('ruby' 'git')
source=(http://git-wt-commit.rubyforge.org/${pkgname})
md5sums=('a90f8260fa56afe6469893cb384a94fd')

build() {
  install -D ${pkgname} ${pkgdir}/usr/lib/git-core/${pkgname}
}

# vim:set ts=2 sw=2 et:
