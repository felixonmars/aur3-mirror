# Maintainer: Thorsten Töpper <atsutane-aur@freethoughts.de>
# Contributors: William Giokas <1007380@gmail.com>
#               Julien Rolland <contact@julien-rolland.com>

pkgname=i3status-gmail-git
pkgver=2.7.18.gbcc8932
pkgrel=1
pkgdesc='i3status, gmail patched version'
arch=('i686' 'x86_64')
url='http://i3wm.org/i3status/'
license=('BSD')
groups=('i3-vcs')
depends=('wireless_tools' 'confuse' 'alsa-lib' 'yajl' 'curl' 'ca-certificates')
makedepends=('git' 'pkgconfig' 'asciidoc')
options=('docs')
install=i3status.install
conflicts=('i3status' 'i3status-git')
provides=('i3status')
source=('git://code.i3wm.org/i3status'
        '0001-add-gmail-module.patch')
md5sums=('SKIP'
         '951bd601d122f61f343e3a2ccf72e7fa')

_gitname='i3status'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname"
  msg "Applying gmail module patch..."
  git am --signoff < ../0001-add-gmail-module.patch
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  make clean
}

# vim:set ts=2 sw=2 et:
