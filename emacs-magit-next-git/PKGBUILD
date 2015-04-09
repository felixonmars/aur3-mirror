# Maintainer: Brice Waegeneire <brice dot wge at gmail dot com>
# Contributor: Stefan Husmann <stefan.husmann@t-online.de>
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Just Lest <just.lest@gmail.com>
# Contributor: Daniel White <daniel@whitehouse.id.au>

pkgname=emacs-magit-next-git
pkgver=r6422.9ffd7a5
pkgrel=1
pkgdesc="It's Magit! A Emacs mode for Git. Branch: next."
arch=('any')
url="http://github.com/magit/magit"
license=('GPL3')
depends=('emacs' 'git' 'emacs-git-modes-git')
makedepends=('automake' 'autoconf' 'ed')
provides=('emacs-magit')
conflicts=('emacs-magit'
	  'emacs-magit-git')
install="${pkgname}.install"
_gitname="magit"
source=('git+https://github.com/magit/magit.git#branch=next')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  make EFLAGS="-L /usr/share/emacs/site-lisp -L /usr/share/emacs/site-lisp/git-modes" lisp docs
}

package() {
  cd "$_gitname"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
