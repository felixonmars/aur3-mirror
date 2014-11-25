pkgname=urw-classico
pkgver=20140828
pkgrel=1
pkgdesc="URW Classico fonts from CTAN (for texlive), an Optima typeface"
arch=('any')
license=('CUSTOM:aladdin')
url=("http://www.ctan.org/tex-archive/fonts/urw/classico")
depends=(texlive-core)
install=$pkgname.install
source=(http://mirrors.ctan.org/install/fonts/urw/classico.tds.zip urw-classico.maps)
md5sums=('166eb8e7f2e1ca764b02e00aae5e86fb
          1a06059b7f86bf45b3d065eec2d27287')

package() {
  cd "$srcdir"
  _texmf_root=usr/share/texmf-dist
  install -d -m 755 "$pkgdir/var/lib/texmf/arch/installedpkgs"
  install -m 644 $pkgname.maps "$pkgdir/var/lib/texmf/arch/installedpkgs"

  install -d -m755 "$pkgdir/$_texmf_root/fonts/afm/urw/classico"
  install -m644 fonts/afm/urw/classico/*.afm "$pkgdir/$_texmf_root/fonts/afm/urw/classico"

  install -d -m755 "$pkgdir/$_texmf_root/fonts/enc/dvips/classico"
  install -m644 fonts/enc/dvips/classico/*.enc "$pkgdir/$_texmf_root/fonts/enc/dvips/classico"

  install -d -m755 "$pkgdir/$_texmf_root/fonts/map/dvips/classico"
  install -m644 fonts/map/dvips/classico/*.map "$pkgdir/$_texmf_root/fonts/map/dvips/classico"

  install -d -m755 "$pkgdir/$_texmf_root/tex/latex/classico"
  install -m644 tex/latex/classico/* "$pkgdir/$_texmf_root/tex/latex/classico"

  install -d -m755 "$pkgdir/$_texmf_root/fonts/tfm/urw/classico"
  install -m644 fonts/tfm/urw/classico/*.tfm "$pkgdir/$_texmf_root/fonts/tfm/urw/classico"

  install -d -m755 "$pkgdir/$_texmf_root/fonts/type1/urw/classico"
  install -m644 fonts/type1/urw/classico/*.pfb "$pkgdir/$_texmf_root/fonts/type1/urw/classico"

  install -d -m755 "$pkgdir/$_texmf_root/fonts/vf/urw/classico"
  install -m644 fonts/vf/urw/classico/*.vf "$pkgdir/$_texmf_root/fonts/vf/urw/classico"
  
  install -d -m755 "$pkgdir/$_texmf_root/fonts/opentype/urw/classico"
  install -m644 fonts/opentype/urw/classico/*.otf "$pkgdir/$_texmf_root/fonts/opentype/urw/classico"
  
  install -m644 -D doc/fonts/classico/COPYING.AFPL "$pkgdir/usr/share/licenses/$pkgname/COPYING"

# If you want these fonts installed system-wide (available for all users), uncomment these lines:
#
#  _fonts_dir=usr/share/fonts/Type1
#  install -d -m755 "$pkgdir/$_fonts_dir"
#  install -m644 fonts/afm/urw/classico/*.afm "$pkgdir/$_fonts_dir"
#  install -m644 fonts/type1/urw/classico/*[dcr].pfb "$pkgdir/$_fonts_dir"
#  install -m644 fonts/pfm/urw/classico/*.pfm "$pkgdir/$_fonts_dir"
}
