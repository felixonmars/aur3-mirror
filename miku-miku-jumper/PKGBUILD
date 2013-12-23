# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=miku-miku-jumper
pkgver=1.0.0
pkgrel=1
pkgdesc="This game is a 2D platformer 8bit style. Aim all 20 Stage Clear"
url="http://sourceforge.jp/projects/mikumikujumper/"
license=('Yawaraka')
arch=('i686' 'x86_64')
depends=('mesa' 'openal')
_mirror="jaist" # "jaist" "iij" "osdn" "keihanna"
source=("http://${_mirror}.dl.sourceforge.jp/mikumikujumper/60073/mmj_ubuntu_${pkgver//./}.zip")

package() {
  cd "${srcdir}/mmj_ubuntu_100"
  sed -i 's/YYAppExePath/\/opt\/MikuMikuJumper/' MikuMikuJumper/SideViewAction.desktop
  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/mmj_ubuntu_100/MikuMikuJumper" "${pkgdir}/opt"
  
  cd "${srcdir}/mmj_ubuntu_100/MikuMikuJumper"
  sed -n '/License/,/problems./p' readme.txt > LICENSE
  install -Dm644 SideViewAction.desktop "${pkgdir}/usr/share/applications/miku-miku-jumper.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('bbd00c5b2211bcbfddc129301e6e46a0')
