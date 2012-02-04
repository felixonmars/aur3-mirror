# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Nick Lanham <nick@afternight.org>
pkgname=luximono
pkgver=1.0
pkgrel=1
pkgdesc="LuxiMono monospace font from CTAN (for texlive)"
arch=('any')
license=('custom')
url=("http://www.ctan.org/tex-archive/fonts/LuxiMono/")
depends=(texlive-core)
install=$pkgname.install
source=(http://mirror.ctan.org/fonts/LuxiMono.zip)
md5sums=('24a5a4ed96993a4018ac99d009446c9e')

package() {
  cd $srcdir
  _texmf_root=usr/share
  install -d $pkgdir/$_texmf_root/texmf/fonts/type1/public/luxi
  install -d $pkgdir/$_texmf_root/texmf/fonts/afm/public/luxi
  install -m 644 LuxiMono/*.pfb \
    $pkgdir/$_texmf_root/texmf/fonts/type1/public/luxi
  install -m 644 LuxiMono/*.afm \
    $pkgdir/$_texmf_root/texmf/fonts/afm/public/luxi
  bsdtar -x -f LuxiMono/ul9.zip -C $pkgdir/$_texmf_root/texmf
  install -d $pkgdir/$_texmf_root/texmf/fonts/map/dvips/ul9
  mv $pkgdir/$_texmf_root/texmf/dvips/config/ul9.map \
    $pkgdir/$_texmf_root/texmf/fonts/map/dvips/ul9
  rm -rf $pkgdir/$_texmf_root/texmf/{dvips,doc}
  install -d $pkgdir/usr/share/licenses/$pkgname 
  install -m 644 LuxiMono/LICENSE \
    $pkgdir/usr/share/licenses/$pkgname
}