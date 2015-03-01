# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=birdfont-git
pkgver=r1714.bdab4e4
pkgrel=1
pkgdesc='Font editor that lets you create vector graphics and export TTF, EOT & SVG fonts - from git'
url='http://birdfont.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('webkitgtk' 'libgee')
makedepends=('git' 'vala' 'python2')
install=birdfont-git.install
source=('git+https://git.gitorious.org/birdfont/birdfont.git'
        'http://www.unicode.org/Public/UNIDATA/NamesList.txt')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd birdfont
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

prepare() {
  cd birdfont
  sed -i '1 s/python/&2/' configure install.py
  sed -i -e 's/gtk+-2.0/gtk+-3.0/g' ./scripts/build.py	
}

build() {
  cd birdfont
  ./configure --prefix=/usr
  ./scripts/linux_build.py --prefix=/usr
}

package() {
  cd birdfont
  ./install.py --dest="$pkgdir" --manpages-directory=/share/man --libdir=/lib
  install -Dm644 "$srcdir"/NamesList.txt "$pkgdir"/usr/share/unicode/ucd/NamesList.txt
}
