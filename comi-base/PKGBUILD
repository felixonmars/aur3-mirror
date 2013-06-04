pkgname=comi-base
pkgver=1.0
pkgrel=1
pkgdesc="Shared files for the Curse of Monkey Island. Requires original files."
arch=('any')
url="http://www.lucasarts.com/products/monkey/Default.htm"
license=('custom')
source=('comi.la0::local://comi.la0'
        'comi.la1::local://comi.la1'
        'comi.la2::local://comi.la2'
        'fg010gp.san::local://fg010gp.san'
        'font0.nut::local://font0.nut'
        'font1.nut::local://font1.nut'
        'font2.nut::local://font2.nut'
        'font3.nut::local://font3.nut'
        'font4.nut::local://font4.nut'
        'kis030.san::local://kis030.san'
        'musdisk1.bun::local://musdisk1.bun'
        'musdisk2.bun::local://musdisk2.bun'
        'sb010.san::local://sb010.san'
        'sb020.san::local://sb020.san'
        'zap010.san::local://zap010.san')
sha256sums=('22cf910b853db0615b6e86b4fb320144bd807c99b5e93619bfaefa8a9d06d3b9'
            'fd71129d567c788555fdd55b870f52eb609582f12520b4474e7fb7c3827ca9e1'
            '3ee1ed35fefe472eb3a5ec35086650fcff96ee2752e1bc9d7831167c6c2413ac'
            '8be5a7be705aafbd08b610fe3a7e716a26222805a21427a2da788b05144a68ec'
            '22145873f8beae7bfaa0e13f88e25b7f480d5e367fdb7d9c3bb119a9ab1ecc03'
            'fa5dce384012cf9e5b832f1312e28122df8b2265ed439db8d4117bd6133d017d'
            'fa5dce384012cf9e5b832f1312e28122df8b2265ed439db8d4117bd6133d017d'
            'c1a99f65c6a18faa5b5071505c0a0509e8f6552e7d8202e174605f3175beee53'
            'dcb41776b61851ec84a39d54b810ff32b2b2cc128ee7ac602b657b0232e3b844'
            '5f7249141ea8a00c4c88fae5f4a0fd34de8c763a09b40f9eb8e0f29e77dd7e13'
            'd1c3d6c835975dac0adf9e9c1172aa1ae64a9216a8ac5ad59f31f43a43d26088'
            'd13f279e32fc563c64c499980662deb9d378974950c7e95975f9278d41be5211'
            'a50573dedc3a458725a8ec82cf5daa880584e1112ff0354e944d3fda8e162bbe'
            'a40a2e07498cc9793d396009d2601e65d2fea1fd9dafce49c8df36017a1d600a'
            'c63209370af4fad35e04d6e8b5a64c0e3bec31ccbdd68e59e085664f30d9c44a')
PKGEXT='.pkg.tar'
DLAGENTS=('local::/bin/true')

package() {
  install -d $pkgdir/usr/share/games/comi/shared/resource/

  install -m644 comi.la{0,1,2} $pkgdir/usr/share/games/comi/shared/

  install -m644 {*.bun,*.nut,*.san} $pkgdir/usr/share/games/comi/shared/resource/
}
