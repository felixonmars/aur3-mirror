pkgname=coccigrep
pkgver=20131117
pkgrel=1
pkgdesc="Semantic grep for the C language (git version)"
url="http://home.regit.org/software/coccigrep/"
license=('GPL')
depends=('python2' 'coccinelle')
makedepends=('git')
optdepends=('python2-pygments: to highlight the C-code colorful')
options=("!strip")
arch=('i686' 'x86_64')
source=("git+https://github.com/regit/coccigrep.git")
md5sums=("SKIP")

build() {
  cd $srcdir/coccigrep
  python2 setup.py build
}

package() {
  cd $srcdir/coccigrep
  python2 setup.py install --root="$pkgdir" --prefix="/usr" --optimize=1
  local _mandir="${pkgdir}/usr/share/man/man1"
  mkdir -p "$_mandir"
  install -m644 coccigrep.1 "$_mandir"
}
