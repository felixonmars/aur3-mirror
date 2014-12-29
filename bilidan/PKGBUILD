# Maintainer: Tom Bu <tom.bu[at]openmailbox.org>
pkgname=bilidan
pkgver=20141228
pkgrel=1
pkgdesc="Play videos on Bilibili.com with MPV and Danmaku2ASS"
url="https://github.com/m13253/BiliDan"
arch=('any')
license=('MIT')
depends=('python>=3' 'mpv' 'ffmpeg' 'danmaku2ass-git')
provides=('bilidan')
conflicts=('bilidan')
makedepends=('git')
source=("git+https://github.com/m13253/BiliDan.git")
md5sums=('SKIP')
_reponame=BiliDan

pkgver() {
  cd ${srcdir}/${_reponame}
  echo $(git log -1 --format="%cd" --date=short | tr -d -)
}

package() {
  cd ${srcdir}/${_reponame}
  install -Dm755 bilidan.py ${pkgdir}/usr/bin/bilidan
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
