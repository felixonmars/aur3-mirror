# Maintainer:Robin Choudhury <rchoudhu@calpoly.edu>>
pkgname=git-scripts-git
pkgver=20130719
pkgrel=3
pkgdesc="User scripts for managing feature branches and hotfixes."
arch=('any')
url="https://github.com/iFixit/git-scripts"
license=('MIT')
depends=('ruby')
makedepends=('git')
provides=('git-scripts-git')
conflicts=('git-scripts-git')

source=("git://github.com/iFixit/git-scripts.git")
noextract=()
md5sums=('SKIP')

_gitname='git-scripts'

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/git-scripts"

  # Build it!
  gem build git-scripts.gemspec
}

package() {
  cd "${srcdir}/git-scripts"

  # Install the program.
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}$(ruby -e 'puts Gem.default_dir')" \
    -n "${pkgdir}/usr/bin" \
    git-scripts
}
