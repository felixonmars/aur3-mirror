# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: Robson Roberto Souza Peixoto <robsonpeixoto@gmail.com>
# Contributor: Bernardo Barros <bernardobarros@NOSPAM.gmail.com>

pkgname=abntex-svn
pkgver=23
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc='abntex is a class LaTeX for writing documents in ABNT standard.'
arch=('i686' 'x86_64')
url="http://abntex.sourceforge.net/"
license=('LPPL')
depends=('texlive-core')
install=abntex.install

_svntrunk="https://abntex.svn.sourceforge.net/svnroot/abntex/trunk/abntex"
_svnmod=abntex

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # Lyx layout
  install -D -m 644 lyx/layouts/abnt.layout \
    "${pkgdir}/usr/share/lyx/layouts/abnt.layout"

  install -dm755 "${pkgdir}/usr/share/texmf-dist/"

  for subdir in bibtex makeindex tex; do
    cp -r "texmf/${subdir}" "${pkgdir}/usr/share/texmf-dist/"
  done

  cd "${pkgdir}/usr/share/texmf-dist"
  find . -type d -exec chmod 755 {} \;
  find . -type f -exec chmod 644 {} \;
}
