# Maintainer: Carlos Xavier <carlos_xavier@ymail.com>
pkgname=ttf-wedding
pkgver=1
pkgrel=1
pkgdesc="Four beautiful fonts to create wedding invitations"
arch=('any')
url=('http://www.netfontes.com.br/')
license=('Unknown proprietary')
depends=('fontconfig' 'xorg-font-utils')
source=("ttf-brock_script.zip::http://www.netfontes.com.br/dow.php?cod=brock_script"
	"ttf-chopin_script.zip::http://www.netfontes.com.br/dow.php?cod=chopin_script"
	"ttf-porcelain.zip::http://www.netfontes.com.br/dow.php?cod=porcelain"
	"ttf-champignon.zip::http://www.netfontes.com.br/dow.php?cod=champignon")
md5sums=('14eab9840b67bd4ef26015f6184c02c8'
	'b527686faf286a3b93a1a88c367a788f'
	'71a478178f0ad7f4f08aaa71dcd84984'
	'85b8f9401982e2d7d935ad28ca19cb4f')
install=$pkgname.install

build(){
  install -Dm 644 "$srcdir/brocs___.TTF" "$pkgdir/usr/share/fonts/TTF/Brock_Script.ttf"
  install -Dm 644 "$srcdir/CHOPS___.TTF" "$pkgdir/usr/share/fonts/TTF/Choppin_Script.ttf"
  install -Dm 644 "$srcdir/PORCELAI.TTF" "$pkgdir/usr/share/fonts/TTF/Porcelain.ttf"
  install -Dm 644 "$srcdir/Champignon.ttf" "$pkgdir/usr/share/fonts/TTF/Champignon.ttf"
}

