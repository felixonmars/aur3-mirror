pkgname=comi-en
pkgver=1.0
pkgrel=3
pkgdesc="The Curse of Monkey Island (English version) for ScummVM. Requires original files."
arch=('any')
url="http://www.lucasarts.com/products/monkey/Default.htm"
license=('custom')
depends=('comi-base' 'scummvm')
source=('comi-en'
        'comi-en.desktop'
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
sha256sums=('3f8779290a8a5a86de2ffc07d7962659bfa5c9cb153dd97bb276f17eb1a35122'
            'e636232d0641947cfdebb0e492766b1ae2f6b4b702ae63b4862b0e15066af231'
            '9325da7845276418c14a715ad3748e40a65584bf890a54a417670aeaec78c0fa'
            '0522efeffea9905b51a48729fab4f3860da3619489dc9cecac3e64b685fe3d0d'
            'ed063511b33a71b39cf629b45d0327ddd148b9e2f10aed989b091c5adc6dacc6'
            'f92c850fa0ec0bc9afa8f1b391843b63d37f7c3b3a08d5346a3508ca1a703e61'
            '9b64d17419b1509c07332d81edd0552d8db3d79d349e9285e9c702f32129f38c'
            '1da5bb095be25f35ea1b18323e4228dc37f36f3408ecdf52c4b345527601e762'
            '9f59c70a6e24c46d9bd2403ba68a8e0ecf89821e2957534fd05454eb35925a59'
            'e397a555797248182e39bf016bd2f2461db6219b2b86ee093c8c5cc0aaab0519'
            '97ea0f295cfdc23498523ab772412b6bd1235afa6ca241ac762d241296022736'
            'bff4ecbea93ba708d89aafbd1b64594c17b322a5942669598910bd4a05cc2152'
            '960af263b4b527ca4f33d709fba338ec2363daf21aac69bc9df309b48c925dfd'
            '318168bb78ac0cf38e5391e56870996597e800ed6615a5f4c296d6fae216d146'
            '0732e0871ebe9c4e16ad4a684436dd64e2c89e06f97170f3b811461c5f0345b2'
            '17d726cd91ee53a0b721c7a046428e2f5a316b9ae7503f4d0b3d60acb2ad5712')
PKGEXT='.pkg.tar'
DLAGENTS=('local::/bin/true')

build() {
  tail -n +220 readme.txt > LICENSE
}

package() {
  install -Dm755 comi-en $pkgdir/usr/bin/comi-en

  install -d $pkgdir/usr/share/games/comi/en/resource/

  ln -s /usr/share/games/comi/shared/comi.la0 $pkgdir/usr/share/games/comi/en/comi.la0
  ln -s /usr/share/games/comi/shared/comi.la1 $pkgdir/usr/share/games/comi/en/comi.la1
  ln -s /usr/share/games/comi/shared/comi.la2 $pkgdir/usr/share/games/comi/en/comi.la2

  install -m644 {*.bun,*.san,language.tab} $pkgdir/usr/share/games/comi/en/resource/

  ln -s /usr/share/games/comi/shared/resource/fg010gp.san $pkgdir/usr/share/games/comi/en/resource/fg010gp.san
  ln -s /usr/share/games/comi/shared/resource/font0.nut $pkgdir/usr/share/games/comi/en/resource/font0.nut
  ln -s /usr/share/games/comi/shared/resource/font1.nut $pkgdir/usr/share/games/comi/en/resource/font1.nut
  ln -s /usr/share/games/comi/shared/resource/font2.nut $pkgdir/usr/share/games/comi/en/resource/font2.nut
  ln -s /usr/share/games/comi/shared/resource/font3.nut $pkgdir/usr/share/games/comi/en/resource/font3.nut
  ln -s /usr/share/games/comi/shared/resource/font4.nut $pkgdir/usr/share/games/comi/en/resource/font4.nut
  ln -s /usr/share/games/comi/shared/resource/kis030.san $pkgdir/usr/share/games/comi/en/resource/kis030.san
  ln -s /usr/share/games/comi/shared/resource/musdisk1.bun $pkgdir/usr/share/games/comi/en/resource/musdisk1.bun
  ln -s /usr/share/games/comi/shared/resource/musdisk2.bun $pkgdir/usr/share/games/comi/en/resource/musdisk2.bun
  ln -s /usr/share/games/comi/shared/resource/sb010.san $pkgdir/usr/share/games/comi/en/resource/sb010.san
  ln -s /usr/share/games/comi/shared/resource/sb020.san $pkgdir/usr/share/games/comi/en/resource/sb020.san
  ln -s /usr/share/games/comi/shared/resource/zap010.san $pkgdir/usr/share/games/comi/en/resource/zap010.san

  install -Dm644 comi-en.desktop $pkgdir/usr/share/applications/comi-en.desktop 

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/comi-en/LICENSE
}
