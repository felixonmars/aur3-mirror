pkgname=k3b-themes
pkgver=0.0.1
pkgrel=1
pkgdesc="Additional K3b themes from kde-look.org - Clean, Penguin Attack Dark Blue, Firework and Light My Fire"
license=('GPL')
arch=(i686 x86_64)
url="http://www.kde-look.org"
depends=('k3b')
source=('http://www.cbebop.com/stuff/k3b/clean_purp.tar.bz2'
'http://www.cbebop.com/stuff/k3b/clean.tar.bz2'
'http://www.cbebop.com/stuff/k3b/clean_vd.tar.bz2'
'http://www.cbebop.com/stuff/k3b/clean_r.tar.bz2'
'http://www.cbebop.com/stuff/k3b/clean_g.tar.bz2'
'http://www.logri.net/downloads/k3b_themes.tar.gz'
'http://kde-look.org/CONTENT/content-files/55172-firework_0.1.tar.bz2'
'http://kde-look.org/CONTENT/content-files/54888-Penguin_Attack_Dark_Blue.tar.gz'
)
md5sums=('b93cd91ce80dca5df53236e103417507'
'd6e98941e64adbcb53ae2f46c8b3b17f'
'171923f4f1e436b1e410ac0cded68691'
'e913e4902b25af4dd514709f7ec6809b'
'720b9cdfdd5fc7fa0fc18baa7177e8ed'
'784fc18bf8157b3282137638f3228bda'
'60c43bcac9cc5514815cfa12e7b5c913'
'940be531a2da82b96359ec4382664695'
)

build() {
  cd ${startdir}/src/
  tar -zxf ${startdir}/src/k3b_themes/grassy_light.tar.gz
  tar -zxf ${startdir}/src/k3b_themes/iceman_blue.tar.gz
  tar -zxf ${startdir}/src/k3b_themes/light_my_fire.tar.gz
  mkdir -p ${startdir}/pkg/opt/kde/share/apps/k3b/pics
  cp -R clean_purp  ${startdir}/pkg/opt/kde/share/apps/k3b/pics/
  cp -R clean_b  ${startdir}/pkg/opt/kde/share/apps/k3b/pics/
  cp -R clean_g  ${startdir}/pkg/opt/kde/share/apps/k3b/pics/
  cp -R clean_r  ${startdir}/pkg/opt/kde/share/apps/k3b/pics/
  cp -R clean_vd  ${startdir}/pkg/opt/kde/share/apps/k3b/pics/
  cp -R firework  ${startdir}/pkg/opt/kde/share/apps/k3b/pics/
  cp -R grassy_light  ${startdir}/pkg/opt/kde/share/apps/k3b/pics/
  cp -R iceman_blue  ${startdir}/pkg/opt/kde/share/apps/k3b/pics/
  cp -R light_my_fire  ${startdir}/pkg/opt/kde/share/apps/k3b/pics/
  cp -R Penguin_Attack_Dark_Blue  ${startdir}/pkg/opt/kde/share/apps/k3b/pics/


  cd ${startdir}/pkg/opt/kde/share/apps/k3b/pics/

  # fix file permissions
  chmod -R 755 grassy_light
  chmod -R 755 iceman_blue
  chmod -R 755 light_my_fire

  # beautify names
  mv clean_purp "Clean - Purple"
  mv clean_b "Clean - Blue"
  mv clean_g "Clean - Green"
  mv clean_r "Clean - Red"
  mv clean_vd "Clean - Gray"
  mv firework Firework
  mv Penguin_Attack_Dark_Blue "Penguin Attack - Dark Blue"
  mv grassy_light "Grassy Light"
  mv iceman_blue "Iceman Blue"
  mv light_my_fire "Light My Fire"
}
