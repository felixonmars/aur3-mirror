# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=eduke32-dukeplus
pkgver=2.35 
pkgrel=3
pkgdesc="An EDuke32 mod providing optional enhancements like new options and effects"
arch=('any')
url="http://fissile.duke4.net/fissile_dukeplus.html"
license=('GPL')
depends=('eduke32>=20090313')
makedepends=( )
source=( http://fissile.duke4.net/dp/DUKEPLUS.zip \
	$pkgname.sh 'eduke32-dukeplus.desktop')
         
         
md5sums=('4aa2e4df4e645f7787a7c745d61bf96c'
         '3368823d63ec954097044d6680d68ffe'
         '9f32d5cf1062e061f42566f614f86b70')
         
         
build() {
  #unrar x -o+ -inul DukePlus.rar || return 1
  #fix
  #unzip -o -q dpcons.zip -d DukePlus

#  sed '/dp.cfg/d' -i DukePlus/dpcons/DUKEPLUS.CON

  

  indir=${srcdir}/"DukePlus Install/DukePlus"
  #Fixes for filenames
  cd "${indir}"
  mv "strooper" "Strooper"
  #fix after that strooper->Strooper in dpcons/DUKEPLUS.CON
  sed -i 's/DukePlus\/strooper/DukePlus\/Strooper/g' "dpcons/DUKEPLUS.CON"
  
  cd "${indir}/DUKEPLUS_RESOURCES/GRAPHICS/civilians/"
  #head->Head, body->Body
  for ff in $( ls */*.png|grep "body" ) ; do mv "$ff" "${ff/body/Body}" ; done
  for ff in $( ls */*.png|grep "head" ) ; do mv "$ff" "${ff/head/Head}" ; done
  cd "${indir}/DUKEPLUS_RESOURCES/GRAPHICS/MAP_EFFECTS"
  # bmp -> BMP  
  mv "black_hawk.bmp" "black_hawk.BMP"
  mv "models/black_hawk/black_hawk.bmp" "models/black_hawk/black_hawk.BMP"
  mv "models/nissan/nissan.bmp" "models/nissan/nissan.BMP"
  mv "models/parking_meter/parkingm.bmp" "models/parking_meter/parkingm.BMP"
  # Upper->lower, etc
  files_to_lower="models/sheriff/SHERIFF.jpg models/sheriff/SHERIFFG1.png models/sheriff/SHERIFFG.png \
  models/lamp_post/LAMPPOST.jpg models/lamp_post/LAMPPOSTG.png models/br_flourlight/BR_FLOURLIGHT.png \
  models/br_flourlight/gBR_FLOURLIGHT.png models/br_briefcase/br_Briefcase.jpg models/br_Crates2"
  
  for ff in ${files_to_lower}
  do
  f_name=${ff##*/}
  f_dir=${ff%/*}
    mv "${ff}" "${f_dir}/${f_name,,}"
  done 
  
  
}

package() {
  cd ${srcdir}
    
  mkdir -p "${pkgdir}/usr/share/eduke32"
  cp -r "DukePlus Install/DukePlus" "${pkgdir}/usr/share/eduke32/" 
  find "${pkgdir}" -type f -exec chmod 644 {} \;

  install -Dm 755 $pkgname.sh ${pkgdir}/usr/bin/${pkgname}
  install -Dm 644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop

}


