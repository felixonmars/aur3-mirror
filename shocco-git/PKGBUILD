# Maintainer: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
pkgname="shocco-git"
pkgver=20120217
pkgrel=1
pkgdesc="literate-programming-style documentation generator written for and in POSIX shell"
arch=('any')
url="http://rtomayko.github.com/shocco/"
license=('MIT')
depends=('perl-text-markdown' 'python2-pygments')
makedepends=('git')
optdepends=('dash: small POSIX compliant shell'
            'ronn: builds manuals')
conflicts=('shocco')
provides=('shocco')

_gitroot="git://github.com/rtomayko/shocco.git"
_gitname="shocco"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname"
  ./configure --prefix=/usr
  make

  msg "Patching..."
  ed -s "$srcdir"/"$_gitname"/shocco <<< $'/^MARKDOWN=/s:\'.*\':\'/usr/bin/vendor_perl/Markdown.pl\':p\nw'
}

package() {
  install -Dm755 "$srcdir/$_gitname/shocco" "$pkgdir/usr/bin/shocco"
  install -Dm644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/shocco/LICENSE"
}

# vim: ft=sh syn=sh et
