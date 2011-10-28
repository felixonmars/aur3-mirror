pkgname=ttf-ms-fonts-zh
pkgver=1.0
pkgrel=1
pkgdesc="Chinese TTF fonts from latest microsoft windows installation"
arch=('any')
url="http://windows.microsoft.com/"
license=('custom')
depends=()
source=()
md5sums=()
install='fonts.install'
_winpath=('/media/windows') #path of windows c:/ drive

build(){
  cd $srcdir
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cd $_winpath/Windows/Fonts
  cp msjh.ttf msjhbd.ttf \
     msyh.ttf msyhbd.ttf \
     simhei.ttf simfang.ttf simkai.ttf simsun.ttc simsunb.ttf \
     mingliu.ttc mingliub.ttc \
     kaiu.ttf \
     $pkgdir/usr/share/fonts/TTF
}
