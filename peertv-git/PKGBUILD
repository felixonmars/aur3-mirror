pkgname=peertv-git
_gitname=peertv
pkgver=0.0.9.r4.g593a90b
pkgrel=1
pkgdesc="Command line tool for manage and play series from EZTV"
arch=('any')
url="https://git.frangor.info/peertv"
license=('GPL3')
depends=('peerflix' 'mpv' 'sqlite' 'curl')
makedepends=('git')
provides=('peertv-git')
conflicts=('peertv')
optdepends=('subliminal-git: subtitles support')
source=('peertv::git+https://git.frangor.info/peertv#branch=dev')
sha256sums=('SKIP')

pkgver() {
 cd "$srcdir/$_gitname"
git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 peertv "${pkgdir}/usr/bin/${_gitname}"
  install -Dm644 peertv.bash_completion "${pkgdir}/etc/bash_completion.d/${_gitname}"
}

# vim:set ts=2 sw=2 et

