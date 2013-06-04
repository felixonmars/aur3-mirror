pkgname=comi-fr
pkgver=1.0
pkgrel=1
pkgdesc="The Curse of Monkey Island (French version) for ScummVM. Requires original files."
arch=('any')
url="http://www.lucasarts.com/products/monkey/Default.htm"
license=('custom')
depends=('comi-base' 'scummvm')
source=('comi-fr'
        'comi-fr.desktop'
        'readme.txt::local://readme.txt'
        'bbsan.san::local://bbsan.san'
        'curserng.san::local://curserng.san'
        'finale.san::local://finale.san'
        'language.tab::local://language.tab'
        'lavaride.san::local://lavaride.san'
        'liftcrse.san::local://liftcrse.san'
        'moreslaw.san::local://moreslaw.san'
        'newboots.san::local://newboots.san'
        'opening.san::local://opening.san'
        'sinkshp.san::local://sinkshp.san'
        'voxdisk1.bun::local://voxdisk1.bun'
        'voxdisk2.bun::local://voxdisk2.bun'
        'wrecksan.san::local://wrecksan.san')
sha256sums=('cb0872ce77efdded2976b3c65866968c6f115f231c22cb743cb012fa6b464426'
            '74b45706b3a9d76ef100f6027f18e154e736fe8ae91b75f590376ceb271897e9'
            'e376ad6286652b806c03a54dd1a11c5ee42a78e3e365dbfe05fad3871ad6c9c3'
            'e8d325f6b68b33f5b786aef1463ae468baa832790029ac5286c31de6a0e4ddd0'
            'd5946baacbc8226232b6f39571215a7d78f6a066bb2df59cb5c4f00260c60b97'
            'dc1ab9e87e1df30ef6fb8c338be6fc443a50c5c797bd4939992a6855ed29bf7d'
            '5222eae9e48fead428c9aec2836c7342b92f4fa29fcd3e2ca9ce1e3759d03b32'
            '896679b7dcc85a7f41b9a2d10f5d644b966249fb386dbcf899d1c96211aad3b0'
            'f20668113a4c9bef1f0c70b2e7a268f09c8452b91c5025f0a095cf813d7584b4'
            'd62722df730d45dbf240257624894e6ee206dccc844153a9fe7379dd1a9e538c'
            '9b22b1890086a2517e56f473d45d9bfec57deff99bb1fcacad828cf9bff10ed5'
            'f027a3f1f773bdbc7e0485ccb1959c5dfecdfd84bb986ca714d99c004d4270d7'
            'd7f944cf75018841ce000a5051160eef8dab9d1a9b0e4669815ff7508ff7490d'
            'a4bdf8027d473031b3b2decfbc6367011f748e4bf59f03ba96196f068e5cb3fb'
            '7ea6605e3a5d3e8d0e5c1480e80e1993c9b23e77e984a72bda5b7b35df9544b3'
            '84c6c2a47b29bb61edaeffa834d3e7c239abc736ae201ccd4e96bb5c937bf2be')
PKGEXT='.pkg.tar'
DLAGENTS=('local::/bin/true')

build() {
  tail -n +254 readme.txt > LICENSE
}

package() {
  install -Dm755 comi-fr $pkgdir/usr/bin/comi-fr

  install -d $pkgdir/usr/share/games/comi/fr/resource/

  ln -s /usr/share/games/comi/shared/comi.la0 $pkgdir/usr/share/games/comi/fr/comi.la0
  ln -s /usr/share/games/comi/shared/comi.la1 $pkgdir/usr/share/games/comi/fr/comi.la1
  ln -s /usr/share/games/comi/shared/comi.la2 $pkgdir/usr/share/games/comi/fr/comi.la2

  install -m644 {*.bun,*.san,language.tab} $pkgdir/usr/share/games/comi/fr/resource/

  ln -s /usr/share/games/comi/shared/resource/fg010gp.san $pkgdir/usr/share/games/comi/fr/resource/fg010gp.san
  ln -s /usr/share/games/comi/shared/resource/font0.nut $pkgdir/usr/share/games/comi/fr/resource/font0.nut
  ln -s /usr/share/games/comi/shared/resource/font1.nut $pkgdir/usr/share/games/comi/fr/resource/font1.nut
  ln -s /usr/share/games/comi/shared/resource/font2.nut $pkgdir/usr/share/games/comi/fr/resource/font2.nut
  ln -s /usr/share/games/comi/shared/resource/font3.nut $pkgdir/usr/share/games/comi/fr/resource/font3.nut
  ln -s /usr/share/games/comi/shared/resource/font4.nut $pkgdir/usr/share/games/comi/fr/resource/font4.nut
  ln -s /usr/share/games/comi/shared/resource/kis030.san $pkgdir/usr/share/games/comi/fr/resource/kis030.san
  ln -s /usr/share/games/comi/shared/resource/musdisk1.bun $pkgdir/usr/share/games/comi/fr/resource/musdisk1.bun
  ln -s /usr/share/games/comi/shared/resource/musdisk2.bun $pkgdir/usr/share/games/comi/fr/resource/musdisk2.bun
  ln -s /usr/share/games/comi/shared/resource/sb010.san $pkgdir/usr/share/games/comi/fr/resource/sb010.san
  ln -s /usr/share/games/comi/shared/resource/sb020.san $pkgdir/usr/share/games/comi/fr/resource/sb020.san
  ln -s /usr/share/games/comi/shared/resource/zap010.san $pkgdir/usr/share/games/comi/fr/resource/zap010.san

  install -Dm644 comi-fr.desktop $pkgdir/usr/share/applications/comi-fr.desktop 

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/comi-fr/LICENSE
}
