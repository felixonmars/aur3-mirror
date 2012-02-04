# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=mf2pt1
pkgver=2.4.5
pkgrel=3
pkgdesc="Produce PostScript Type 1 fonts from Metafont source"
arch=('i686' 'x86_64')
url="http://www.ctan.org/tex-archive/support/mf2pt1/"
license=('LPPL')
depends=('perl' 't1utils' 'texlive-core')
conflicts=('texlive-core>=2011.24722')
makedepends=('texinfo')
optdepends=('fontforge: support for autohinting Type 1 fonts')
install=$pkgname.install
source=(http://mirror.ctan.org/support/$pkgname.zip)
sha256sums=('e2d137fde6602ac97a2023bb5f0a16c091b8d0061283d353a1509d107f9db14d')

build() {
  cd "$srcdir/$pkgname"

  mv mf2pt1.pl mf2pt1
  mpost -progname=mpost -ini mf2pt1.mp \\dump
  makeinfo mf2pt1.texi
  pod2man --center="User Commands" --date="2 August 2011" \
    --release="v2.4.5" mf2pt1 > mf2pt1.1
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m755 mf2pt1 "$pkgdir/usr/bin/mf2pt1"

  install -D -m644 mf2pt1.mp "$pkgdir/var/lib/texmf/web2c/metapost/mf2pt1.mp"
  install -D -m644 mf2pt1.log "$pkgdir/var/lib/texmf/web2c/metapost/mf2pt1.log"
  install -D -m644 mf2pt1.info "$pkgdir/usr/share/info/mf2pt1.info"
  install -D -m644 mf2pt1.1 "$pkgdir/usr/share/man/man1/mf2pt1.1"

  mkdir -p "$pkgdir/usr/share/doc/mf2pt1"
  install -D -m644 ChangeLog "$pkgdir/usr/share/doc/mf2pt1/ChangeLog"
  install -D -m644 README "$pkgdir/usr/share/doc/mf2pt1/README"
  install -D -m644 mf2pt1.pdf "$pkgdir/usr/share/doc/mf2pt1/mf2pt1.pdf"
}
