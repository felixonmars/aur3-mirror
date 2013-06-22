# Maintainer: TDY <tdy@archlinux.info>

pkgname=furiusiconverter
pkgver=0.2.0.0
pkgrel=1
pkgdesc="A simple Gtk+ interface to convert any video to iPod, iPod Touch, and iPhone MP4 format"
arch=('any')
url="https://launchpad.net/furiusiconverter"
license=('GPL3')
depends=('pygtk' 'ffmpeg')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/${pkgname}_$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop)
sha256sums=('d814955e110b55f2ccbe71d33750a39533f49157d5b1b069d0aea04fa8f54ed3'
            '1ebf1d55b7744d9928393d3971ba95459749c9b019555d5e476296643105b8a0'
            '518c0e2a5f841bb5c2073e2be378ffe9b0aa996f3727c3fa686c91db0cc3170b')

package() {
  cd "$srcdir/${pkgname}_$pkgver/src"

  # python2
  find -type f -name '*.py' -exec sed -i '1s/python/&2/' '{}' \;
  sed -i 's/python/&2/' ../$pkgname

  # dist
  install -dm755 "$pkgdir"/usr/share/$pkgname/{doc,pix,res}
  install -cm644 *.* "$pkgdir/usr/share/$pkgname"
  install -cm644 doc/* "$pkgdir/usr/share/$pkgname/doc"
  install -cm644 pix/* "$pkgdir/usr/share/$pkgname/pix"
  install -cm644 res/* "$pkgdir/usr/share/$pkgname/res"

  # launchers
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
