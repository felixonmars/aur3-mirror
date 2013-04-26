# Contributor: jdj <djin.joo@gmail.com>
# Mapfile update by esrevinu

pkgname=kotex
pkgver=20121201
pkgrel=2
pkgdesc="ko.tex, a Korean language support for LaTeX"
url="http://project.ktug.or.kr/ko.TeX/"
arch=('any')
license=('GPLv3')
depends=('texlive-core' 'kotex-util')
#optdepends=('kotex-extra-hlfont')
makedepends=()
conflicts=()
replaces=()
backup=()
install='kotex.install'
source=(
  "http://ftp.ktug.or.kr/KTUG/ko.TeX/current/kotex-dist-${pkgver}.tar.gz"
  "$pkgname.maps"
)
md5sums=(
  'e827db86bef19a4a2bc84ea9f7c236ba'
  '5642090f3018e7b1edd79d8e91c42b8d'
)
noextract=(
  "kotex-dist-${pkgver}.tar.gz"
)

package() {
  _dest="$pkgdir/usr/share"
  mkdir -p $_dest
  cd "${srcdir}"
  
  _instpkgs="$pkgdir/var/lib/texmf/arch/installedpkgs"
  install -m755 -d $_instpkgs
  install -m644 $pkgname.maps $_instpkgs/

  tar zxf kotex-dist-${pkgver}.tar.gz -C "$_dest"

  chmod 00755 $_dest/texmf-dist
  chmod 00755 $_dest/texmf
  chmod 00755 $_dest/texmf/xindy
  chmod 00755 $_dest/texmf/xindy/modules
  chmod 00755 $_dest/texmf/xindy/modules/lang
  chmod 00755 $_dest/texmf-dist/fonts/
  chmod 00755 $_dest/texmf-dist/makeindex/
  chmod 00755 $_dest/texmf-dist/bibtex/
  chmod 00755 $_dest/texmf-dist/tex/
  chmod 00755 $_dest/texmf-dist/scripts/
  chmod 00755 $_dest/texmf-dist/doc/
  chmod 00755 $_dest/texmf-dist/doc/fonts/
  chmod 00755 $_dest/texmf-dist/tex/xelatex/
  chmod 00755 $_dest/texmf-dist/tex/lualatex/
  chmod 00755 $_dest/texmf-dist/tex/context/
  chmod 00755 $_dest/texmf-dist/tex/luatex/
  chmod 00755 $_dest/texmf-dist/tex/latex/
  chmod 00755 $_dest/texmf-dist/tex/xetex/
  chmod 00755 $_dest/texmf-dist/tex/plain/
  chmod 00755 $_dest/texmf-dist/tex/latex/kotex/
  chmod 00755 $_dest/texmf-dist/tex/latex/kotex/euc/
  chmod 00755 $_dest/texmf-dist/tex/latex/kotex/utf/
  chmod 00755 $_dest/texmf-dist/tex/context/third/
  chmod 00755 $_dest/texmf-dist/bibtex/bst/
  chmod 00755 $_dest/texmf-dist/fonts/tfm/
  chmod 00755 $_dest/texmf-dist/fonts/sfd/
  chmod 00755 $_dest/texmf-dist/fonts/truetype/
  chmod 00755 $_dest/texmf-dist/fonts/misc/
  chmod 00755 $_dest/texmf-dist/fonts/map/
  chmod 00755 $_dest/texmf-dist/fonts/afm/
  chmod 00755 $_dest/texmf-dist/fonts/vf/
  chmod 00755 $_dest/texmf-dist/fonts/type1/
  chmod 00755 $_dest/texmf-dist/fonts/map/dvips/
  chmod 00755 $_dest/texmf-dist/fonts/misc/xetex/
  chmod 00755 $_dest/texmf-dist/fonts/misc/xetex/fontmapping/

  # remove files which conflict with kotex-fonts
  #cd "$pkgdir/usr/share/texmf-dist/fonts"
  #rm -f fea/kotex-dev/luatexko/luakodefault.fea
  #rm -f misc/xetex/fontmapping/kotex-dev/xetexko/jamo-pua.map
  #rm -f misc/xetex/fontmapping/kotex-dev/xetexko/jamo-pua.tec
}

# vim:set ts=2 sw=2 et:
