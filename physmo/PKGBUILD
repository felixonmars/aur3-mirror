# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
pkgname=physmo
pkgver=2.0
pkgrel=1
pkgdesc="A FOSS video motion analysis program, designed as a learning tool for high school physics. "
arch=('i686' 'x86_64')
url="http://physmo.sourceforge.net/"
license=('GPL3')
depends=('java-environment>=6.0' 'ffmpeg' 'vlc>=1.2')
source=("$pkgname::http://sourceforge.net/projects/$pkgname/files/latest/download"
        "physmo.sh")
md5sums=('1aeb5e41b3b5c6253376b076f01467de'
         'bc025b7652e3acafb4d08e139f6b881a')
sha256sums=('2b3738d97befaf7db5dd6a207859270fab48fbd462c7fcab71817dae86432f54'
            '56002aaf6917be53993a0031e9521e0a2768564d8419f7ab293911b4982a4996')

package() {
  cd "$srcdir/linux distro"

  install -d "$pkgdir/usr/share/$pkgname"

  for f in PhysMo.jar *.prop *.png *.ico runPhysMo_linux.sh lib/*
  do
    install -Dm644 $f "$pkgdir/usr/share/$pkgname/$f"
  done

  cp -r src "$pkgdir/usr/share/$pkgname/src"
  find "$pkgdir/usr/share/$pkgname/src" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/$pkgname/src" -type f -exec chmod 644 {} \;

  install -Dm644 about.pdf "$pkgdir/usr/share/doc/$pkgname/about.pdf"
  install -Dm755 "$srcdir/physmo.sh" "$pkgdir/usr/bin/physmo"
}
