# see http://www.microsoft.com/typography/fonts/product.aspx?PID=161
# see https://en.wikipedia.org/wiki/Microsoft_fonts
pkgname=ttf-win7-fonts-cjk
pkgver=7.1
pkgrel=1
pkgdesc="Microsoft Windows 7 CJK TrueType Fonts"
arch=('any')
url="http://www.microsoft.com"
license=('custom')
install="$pkgname.install"
_winpath=('/mnt/windows') #path of windows c:/ drive

package(){
  cd $srcdir
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cd $_winpath/Windows/Fonts
  cp \
    msjh.ttf msjhbd.ttf \
    msyh.ttf msyhbd.ttf \
    simhei.ttf simfang.ttf simkai.ttf simsun.ttc simsunb.ttf \
    mingliu.ttc mingliub.ttc \
    kaiu.ttf \
    meiryo.ttc meiryob.ttc \
    msgothic.ttc \
    msmincho.ttc \
    batang.ttc \
    gulim.ttc \
    malgun.ttf \
    $pkgdir/usr/share/fonts/TTF
}
