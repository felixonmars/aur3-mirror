# Maintainer : Adrien Raffin  <raffinadrien@gmail.com>

pkgname=bsfl
pkgver=2.00_beta_2
pkgrel=2
pkgdesc="library for shell script" 
arch=('any') 
url="http://code.google.com/p/bsfl"
license=('GPL')
source=("http://bsfl.googlecode.com/files/${pkgname}-${pkgver//_/-}.tgz"
        "${pkgname}-${pkgver//_/-}.patch")
sha256sums=('4177eee6c3d39dfc127691e8d48f69eb80e7b5c47c5455fe734f5e4796df1662'
            '72c416db648d0be6d0eaf7e4bee4989e422dd854dd0d076469aa6851edaab35c') 

build() {
    cd ${srcdir}
    msg "Patching file for zsh compatibility..."
    patch -p0 -i ${pkgname}-${pkgver//_/-}.patch
}

package() {
    cd ${srcdir}
    install -D ${pkgname} ${pkgdir}/lib/${pkgname}
}
         
