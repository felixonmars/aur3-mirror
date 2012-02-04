pkgname=virtualmoon
pkgver=5.1
pkgrel=1
pkgdesc="Virtual Moon Atlas - free software for Moon observation or survey"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
url="http://www.ap-i.net/avl/en/start"
source=(http://sourceforge.net/projects/virtualmoon/files/1-%20virtualmoon/Version%205.1/Linux/virtualmoon-5.1-linux.tar
	###Extra textures###
	#High res Clementine photographic textures - 125 MB
	http://prdownloads.sourceforge.net/virtualmoon/TexturesClementine.tgz
	#High res Lunar Orbiter photgraphic texture - 166 MB
	http://prdownloads.sourceforge.net/virtualmoon/TexturesLopam.tgz
	#Airbrush without albedo texture - 40 MB
	http://prdownloads.sourceforge.net/virtualmoon/TexturesAirbrush_na.tgz
	###Pictures library###
	#Best of amateurs - 27 MB
	http://prdownloads.sourceforge.net/virtualmoon/PictureBestOfAmateurs.tgz
	#Lunar Orbiter photographic atlas of the moon (LOPAM) - 25 MB, 5.1 MB
	http://prdownloads.sourceforge.net/virtualmoon/PictureLopam.tgz
	http://prdownloads.sourceforge.net/virtualmoon/PictureLunaStars.tgz
	#Apollo mapping cameras - 40 MB
	http://prdownloads.sourceforge.net/virtualmoon/PictureApolloMapping.tgz
	#Lunar astronautical charts and lunar maps - 62 MB
	http://prdownloads.sourceforge.net/virtualmoon/PictureLAC_LM.tgz
	#Consolidated lunar atlas - 85 MB
	http://prdownloads.sourceforge.net/virtualmoon/PictureCLA.tgz
	#Apollo missions - 9.5 MB
	http://prdownloads.sourceforge.net/virtualmoon/PictureApollo.tgz
	#Luna, Ranger, Lunar Orbiter 1, 2, 3, 5 and Surveyor probes - 5 MB
	http://prdownloads.sourceforge.net/virtualmoon/PictureProbes.tgz
	#Clementine probe - 4.2 MB
	http://prdownloads.sourceforge.net/virtualmoon/PictureClementine.tgz
	#Kaguya probe - 15 MB
	http://prdownloads.sourceforge.net/virtualmoon/PictureKaguya.tgz)
sha1sums=('d040082b03203a740f55b9e8e3a7b51af935b313'
	'91dcd836df110e2222703b4bf44c07843a9d27fc'
	'fdd3e5e3fa4a43ebff9c22585ba96019270a74d6'
	'df7abc9ebcc436f957e23feed9c4a2f1f846dadf'
	'd3e05ada36bcef6c232a333f3e054112b428e979'
	'07e27e707a174b1b1f045a0aaaa097e926b9f43e'
	'a49c85f0d9701de3d9f45dc631a2212c5abcfe82'
	'bef05fef2f2616383cfc8f161cbf27f469ee3c4c'
	'8ab41fdb2025b684ab6dab7995b91f8399deaeb4'
	'95ece23d207ead5752301b37bdae377402be35b1'
	'5d80d52243bb9a6e1ddad579ce1370c379a4af3a'
	'449fb60545e4b487cab4bd67d61b128ee120bdc3'
	'40b50b615f6ff2fa4f98bc1d197907d9bcf24b73'
	'50baf21c538d477bbc3f9f057e2e2d0278c80d4d')
package() {
	tar xf ${srcdir}/virtualmoon-$pkgver-linux.tar
	mkdir ${pkgdir}/usr/
if [[ "$CARCH" == 'i686' ]]; then
	tar xvzf ${srcdir}/virtualmoon-$pkgver-linux_i386.tgz -C ${pkgdir}/usr/
else
	tar xvzf ${srcdir}/virtualmoon-$pkgver-linux_x86_64.tgz -C ${pkgdir}/usr/
fi
	tar xvzf ${srcdir}/virtualmoon-data-$pkgver-linux_all.tgz -C ${pkgdir}/usr/

###Extra textures#### 

#High res Clementine photographic textures - 125 MB
tar xzvf ${srcdir}/TexturesClementine.tgz -C ${pkgdir}/usr/

#High res Lunar Orbiter photgraphic texture - 166 MB
tar xzvf ${srcdir}/TexturesLopam.tgz -C ${pkgdir}/usr/

#Airbrush without albedo texture - 40 MB
tar xzvf ${srcdir}/TexturesAirbrush_na.tgz -C ${pkgdir}/usr/

###Pictures library###

#Best of amateurs -27 MB
tar xzvf ${srcdir}/PictureBestOfAmateurs.tgz -C ${pkgdir}/usr/

#Lunar Orbiter photographic atlas of the moon (LOPAM) - 25 MB, 5.1 MB
tar xzvf ${srcdir}/PictureLopam.tgz -C ${pkgdir}/usr/
tar xzvf ${srcdir}/PictureLunaStars.tgz -C ${pkgdir}/usr/

#Apollo mapping cameras - 40 MB
tar xzvf ${srcdir}/PictureApolloMapping.tgz -C ${pkgdir}/usr/

#Lunar astronautical charts and lunar maps - 62 MB
tar xzvf ${srcdir}/PictureLAC_LM.tgz -C ${pkgdir}/usr/

#Consolidated lunar atlas - 85 MB
tar xzvf ${srcdir}/PictureCLA.tgz -C ${pkgdir}/usr/

#Apollo missions - 9.5 MB
tar xzvf ${srcdir}/PictureApollo.tgz -C ${pkgdir}/usr/

#Luna, Ranger, Lunar Orbiter 1, 2, 3, 5 and Surveyor probes - 5 MB
tar xzvf ${srcdir}/PictureProbes.tgz -C ${pkgdir}/usr/

#Clementine probe - 4.2 MB
tar xzvf ${srcdir}/PictureClementine.tgz -C ${pkgdir}/usr/

#Kaguya probe - 15 MB
tar xzvf ${srcdir}/PictureKaguya.tgz -C ${pkgdir}/usr/

}
