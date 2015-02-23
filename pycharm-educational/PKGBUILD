# Contributor: David Keogh <davekeogh@archlinux.us>

pkgname=pycharm-educational
pkgver=1.0.1
pkgrel=2
pkgdesc="Powerful Python and Django IDE. Educational edition."
arch=('any')
options=('!strip')
url="http://www.jetbrains.com/pycharm/"
license=('Apache')
depends=('java-environment>=6' 'giflib' 'ttf-font')
conflicts=('pycharm' 'pycharm-professional' 'pycharm-community')
provides=('pycharm')
source=(http://download.jetbrains.com/python/$pkgname-$pkgver.tar.gz
        'pycharm-educational.desktop' )
sha256sums=('0f07dd9408dccd26edb03bc552e2c39992dd63ce5a0e398e13c30cd7a023a1b3'
            SKIP)

package() {
  cd $srcdir
  mkdir -p $pkgdir/opt/$pkgname
  cp -R $srcdir/pycharm-edu-$pkgver/* $pkgdir/opt/$pkgname
  
  if [[ $CARCH = 'i686' ]]; then
    rm -f $pkgdir/opt/$pkgname/bin/libyjpagent-linux64.so
    rm -f $pkgdir/opt/$pkgname/bin/fsnotifier64
    echo '-Dawt.useSystemAAFontSettings=on' >> $pkgdir/opt/$pkgname/bin/pycharm.vmoptions
    echo '-Dswing.aatext=true' >> $pkgdir/opt/$pkgname/bin/pycharm.vmoptions
  else
    echo '-Dawt.useSystemAAFontSettings=on' >> $pkgdir/opt/$pkgname/bin/pycharm64.vmoptions
    echo '-Dswing.aatext=true' >> $pkgdir/opt/$pkgname/bin/pycharm64.vmoptions 
  fi

  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  install -Dm644 $startdir/pycharm-educational.desktop $pkgdir/usr/share/applications/
  install -Dm644 $pkgdir/opt/$pkgname/bin/pycharm.png $pkgdir/usr/share/pixmaps/pycharm.png
  
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/pycharm-educational/bin/pycharm.sh $pkgdir/usr/bin/pycharm
}

# vim:set ts=2 sw=2 et:
