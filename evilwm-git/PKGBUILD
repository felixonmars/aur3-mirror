# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=evilwm-git
_pkgname=evilwm
pkgver=20140124.b814db3
pkgrel=1
pkgdesc='Minimalist but usable window manager for the X Window System'
arch=('x86_64' 'i686')
url='http://evilwm.sourceforge.net'
license=('custom')
depends=('libxrandr')
makedepends=('git')
source=("git+http://www.6809.org.uk/repos/evilwm.git"
        LICENSE)
sha256sums=('SKIP'
            '50463448057ce7e65276926e9462f5c8bd5f6c6628f2c42ad0cd8a6373d419e1')
conflicts=('evilwm')
provides=('evilwm')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$_pkgname"

  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" desktopfilesdir=/usr/share/xsessions install
  install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

