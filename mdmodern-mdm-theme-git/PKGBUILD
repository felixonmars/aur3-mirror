#Developed by 'philer'. All credits should go to him.

pkgname=mdmodern-mdm-theme-git
pkgver=0.r6.a1dc839
pkgrel=2
pkgdesc="MDM theme for web devs"
arch=('any')
url='http://github.com/philer/MDModern'
license=('GPL3')
depends=('mdm-display-manager' 'lsb-release')
makedepends=('git')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
options=('!strip')
#install="${pkgname%}.install"
source=("git+https://github.com/philer/${pkgname%-*-*-*}.git"
        "https://farm4.staticflickr.com/3956/15464495258_bf17b850eb_o.png")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${pkgname%-*-*-*}

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  rm -fr mdmodern/.git mdmodern/.gitignore
  rm -f mdmodern/img/bg.png
  cp 15464495258_bf17b850eb_o.png mdmodern/img/bg.png
  
  cd ${pkgname%-*-*-*}

  install -dm 755 "$pkgdir"/usr/share/mdm/html-themes/
  cp -dr --no-preserve='ownership' "$srcdir"/mdmodern "$pkgdir"/usr/share/mdm/html-themes/
}
