# Maintainer: John K. Luebs <https://github.com/jkl1337>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/jkl1337/packages-archlinux.git

pkgname=hid-atari-retrobit-dkms-git
pkgver=r11.d3f6109
pkgrel=1
pkgdesc="kernel module to support useful but broken Retrobit console control adapters"
arch=('i686' 'x86_64')
url="https://github.com/robmcmullen/hid-atari-retrobit"
license=('GPL')
depends=('dkms' 'linux-headers')
makedepends=('git')
provides=('hid-atari-retrobit')
conflicts=('hid-atari-retrobit' 'hid-atari-retrobit-dkms' 'hid-atari-retrobit-git')
install=hid-atari-retrobit-dkms-git.install
_gitroot='git://github.com/robmcmullen/hid-atari-retrobit'
_gitname='hid-atari-retrobit'
_gitbranch='master'
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}"
        dkms.conf.in
        Makefile.dkms)
sha256sums=('SKIP'
            '65ae6dbfbbaffad8e2a48ed20c4da50ec9a12afb9ea101edbb3f8d52809195ba'
            '2fcaaac81440090ccd26676c73825820f28f35bb71d6a359314cbeae291989fc')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_gitname}"

  cp "$srcdir/Makefile.dkms" Makefile
}

build() {
  cd "$srcdir/${_gitname}"

  sed -e "s/@PKGVER@/${pkgver}/" < "${srcdir}/dkms.conf.in" > dkms.conf
}

package() {
  cd "$srcdir/${_gitname}"

  install -dm755 "${pkgdir}/usr/src/hid-atari-retrobit-${pkgver}/"
  cp -r * "${pkgdir}/usr/src/hid-atari-retrobit-${pkgver}/"
}

# vim:set ts=2 sw=2 et:
