# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=k3b-themes-for-kde4
pkgver=1.0
pkgrel=4
pkgdesc="Additional K3b themes for KDE4 from kde-look.org."
license=('GPL')
arch=('any')
url="http://www.kde-look.org/index.php?xcontentmode=63"
source=('http://kde-look.org/CONTENT/content-files/97893-burner-water.tar.gz'
        'http://kde-look.org/CONTENT/content-files/97881-burner.tar.gz'
        'http://www.kde-look.org/CONTENT/content-files/120089-Shearlite.tar.gz'
        'http://kde-look.org/CONTENT/content-files/68312-neon.tar.gz'
        'http://kde-look.org/CONTENT/content-files/65718-being.tar.gz'
        'http://kde-look.org/CONTENT/content-files/55172-firework_0.1.tar.bz2'
        'http://kde-look.org/CONTENT/content-files/54888-Penguin_Attack_Dark_Blue.tar.gz'
        'http://logri.net/downloads/k3b_themes.tar.gz'
        'http://kde-look.org/CONTENT/content-files/50274-crystal_gr.tar.gz'
        'http://kde-look.org/CONTENT/content-files/45699-Laser_light-blue.tar.gz'
        'http://kde-look.org/CONTENT/content-files/45688-Laser_light.tar.gz'
        'http://kde-look.org/CONTENT/content-files/129357-burner-wall.tar.gz'
        'http://kde-look.org/CONTENT/content-files/114417-Oxygen%20Quant.tar.gz'
        'http://kde-look.org/CONTENT/content-files/114157-K3b%20Oxygen1.tar.gz'
        'http://kde-look.org/CONTENT/content-files/114243-K3b%20Dark1.tar.gz'
        'http://kde-look.org/CONTENT/content-files/114212-K3b%20Fire1.tar.gz'
        'http://kde-look.org/CONTENT/content-files/66383-matrix666.tar.gz'
        'http://sourceforge.net/projects/andry/files/New_Oxygen_Themer/Oxygen_New.tar.gz'
        'http://www.altaum.com/media/documents/Oxygen_Ethais.tar.gz'
        'http://kde-look.org/CONTENT/content-files/140336-k3b-soft-1.0.tar.gz'
        'http://kde-look.org/CONTENT/content-files/45373-RobsTheme_Linux.tar.gz')

md5sums=('68ee96643effb079a1185ac7a1ccc7f1' '0200aa4f192e671a99bbab95a83fcc39' 'aecaee4087ce4cb0ba6313deceafc3f3'        
         'f750f139f4c7d2a6c2f9f4618272a17a' '9d6d00fefd7e5ff677707eec37052386' '60c43bcac9cc5514815cfa12e7b5c913'        
         '940be531a2da82b96359ec4382664695' '784fc18bf8157b3282137638f3228bda' 'bf8f74622ad6a00b26b76cf6d0cced7d'        
         'e13b7d1c23f1e9339a70e8124c9d7192' 'a9f26784e54955f301e5e4e0e01b4b6b' 'c1bfb186e830aff9cb23d04249ba0d5e'
         '086d0f3d260165cf03f57f31883104bf' '31cbf9de764908520e69970ddf84127b' '1cbd0e110666551b80f4544c810b8d86'       
         'b9d355a5b4d258021aa1017c8a581fd9' '1f9f64188b89919c4f7b4c96029287fe' '99d17d9ecb7a38de3780bef4b339ab23'
         '492ec0b5f93725daa3aecaf340be635c' 'c61545f2bf88e9709badac064f570b3b' '9b55cdab1113c04bf91e36b170d7685f')

package() {
   cd $startdir

   # Extract themes to K3b's theme directory
   mkdir -p $pkgdir/usr/share/apps/k3b/pics
   tar xvf 97893-burner-water.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 97881-burner.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 120089-Shearlite.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 68312-neon.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 65718-being.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 55172-firework_0.1.tar.bz2 -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 54888-Penguin_Attack_Dark_Blue.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 50274-crystal_gr.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 45699-Laser_light-blue.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 45688-Laser_light.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 129357-burner-wall.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 114417-Oxygen%20Quant.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 114157-K3b%20Oxygen1.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 114243-K3b%20Dark1.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 114212-K3b%20Fire1.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 66383-matrix666.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf Oxygen_Ethais.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf Oxygen_New.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 45373-RobsTheme_Linux.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf 140336-k3b-soft-1.0.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
         
   # Extract k3b_themes folder
   tar xvf k3b_themes.tar.gz

   # Clean up directory
   rm *.{tar.gz,tar.bz2}
   rm -rf k3b_themes

   # Extract K3b_themes
   cd $srcdir/k3b_themes
   tar xvf grassy_light.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf iceman_blue.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   tar xvf light_my_fire.tar.gz -C $pkgdir/usr/share/apps/k3b/pics
   
   # Fix file permissions
   cd $pkgdir/usr/share/apps/k3b/pics
   chmod -R 755 grassy_light
   chmod -R 755 iceman_blue
   chmod -R 755 light_my_fire

   # Beautify names
   mv firework "Firework"
   mv Penguin_Attack_Dark_Blue "Penguin Attack - Dark Blue"
   mv crystal_gr  "Crystal Grey"
   mv grassy_light "Grassy Light"
   mv iceman_blue "Iceman Blue"
   mv light_my_fire "Light My Fire"
   mv Laser_light "Laser Light Red"
   mv Laser_light-blue "Laser Light Blue"
   mv burner "Burner Flames"
   mv burner-water "Burner Water"
   mv burner-wall "Burner Wall"
   mv neon "Neon"
   mv being "Being"
   mv matrix666 "Matrix 666"
   mv RobsTheme_Linux "RobsTheme Linux"
   mv k3b-soft-1.0 "K3b Soft"
   mv K3b\ Oxygen\ 1.0.4 "K3b Oxygen"
}