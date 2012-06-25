# Contributor: jdj <djin.joo@gmail.com>

pkgname=kotex-extra-hlfont
pkgver=20070807
pkgrel=2
pkgdesc="Optional Korean fonts for ko.tex and LaTeX"
url="http://project.ktug.or.kr/ko.TeX/"
arch=('any')
license=('GPLv3')
depends=('texlive-core')
# optdepends=('java-runtime')
makedepends=()
conflicts=()
replaces=()
backup=()
install='ko.tex-extra-hlfont.install'
source=(
  "http://ftp.ktug.or.kr/KTUG/ko.TeX/extrafonts/ko.tex-extra-hlfont.tar.gz"
)
md5sums=(
  '805c981444137fc12866d645bbc54a3a'
)
noextract=(
  "ko.tex-extra-hlfont.tar.gz"
)

package()
{
  _dest="$pkgdir/usr/share/texmf-dist"
  cd "${srcdir}"
  mkdir -p "$_dest"
  tar zxf ko.tex-extra-hlfont.tar.gz -C "$_dest"
}

# vim:set ts=2 sw=2 et:
