# Maintainer: DeadSurgeon42 <deadsurgeon42 at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl> 
# Contributor: sausageandeggs <s_stoakley at hotmail.co.uk>

pkgname=singularity-git
pkgver=7fa26c99382e
_musicver=007
pkgrel=4
pkgdesc="Strategy game - simulation of true AI - git version"
arch=('any')
url="http://emhsoft.com/singularity/index.html"
license=('GPL2' 'custom')
depends=('git' 'python2' 'python2-pygame' 'sdl_image' 'sdl_mixer' 'python2-numpy')
source=("git+https://code.google.com/p/endgame-singularity/" \
        "http://endgame-singularity.googlecode.com/files/endgame-singularity-music-$_musicver.zip" \
        "singularity"
        "singularity.desktop")
md5sums=('SKIP'
         'SKIP'
         'fe74e41d2d35dd1907342dea8b078651'
         'c0f49fb6d31a2cf4c0b80393df2aad16')

prepare() {
  cd "$srcdir/endgame-singularity"

  sed -i 's|/usr/bin/env python|/usr/bin/env python2|g' "code/singularity.py"

  find . -name \*.pyc -delete
}

package() {
  cd "$srcdir/endgame-singularity"

  # install game
  install -Dm644 singularity.py $pkgdir/usr/share/singularity/singularity.py
  mkdir "$pkgdir/usr/share/singularity/music/"
  cp -R code data "$pkgdir/usr/share/singularity/"
  cp -R $srcdir/endgame-singularity-music-$_musicver/* "$pkgdir/usr/share/singularity/music/"

  # install shell script
  install -Dm755 "$srcdir/singularity" "$pkgdir/usr/bin/singularity"

  # desktop file
  install -Dm644 "$srcdir/singularity.desktop" "$pkgdir/usr/share/applications/singularity.desktop"

  # license: code is GPL2, but data & music fall under other licenses
  install -Dm644 README.txt "$pkgdir/usr/share/doc/singularity/README.txt"
  install -d "$pkgdir/usr/share/licenses/singularity/"
  cd "$pkgdir/usr/share/licenses/singularity/"
  ln -s ../../doc/singularity/README.txt .

  python2 -m compileall "$pkgdir/usr/share/singularity"
  python2 -O -m compileall "$pkgdir/usr/share/singularity"
}