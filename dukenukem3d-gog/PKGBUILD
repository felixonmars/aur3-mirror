# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=dukenukem3d-gog
pkgver=1.0.0.7
pkgrel=1
pkgdesc="First-person shooter, GoG version, running in Dosbox"
url="http://www.gog.com/game/duke_nukem_3d_atomic_edition"
arch=('x86_64' 'i686')
license=('custom')
depends=('dosbox')
install='dukenukem3d-gog.install'
source=("gog_duke_nukem_3d_1.0.0.7.tar.gz"
        "dukenukem3d.sh"
        "dukenukem3d-settings.sh"
        "dukenukem3d-editor.sh")
md5sums=('2072a6f80786502854a0252af875dcfd'
         '1a1aad49e93039ab010e18e8515bed9a'
         '5340f266fb1cbfb126a4be338e0e9aed'
         '2b0da8c76670e9438bf3017623b498ec')
sha512sums=('d0471bdc65b1030e080de382fea661d78348769d13bca2115ba1fb22aa2de54298bcaa4807c7315d0e2e4eefcc04bc9489d4e4c75fe0db1e99dd0ccd4e138450'
            'e8a4f3dac60c0dad73b2bf42b868fc2e7323a8e38fb2d553f9427103854d80ef4024e867c67641690fd0502fba6299c6f65a9ffb506152cfe0514892245c44d6'
            '95cceab707ff68520d12731a989cb6e1a976f5760b40fc85284066e97f87f0e0442a80d017c47950a4652a74acbe0cbdb3a87b362aed9a8f6e4981974bd16948'
            'ffdbc3963de7f7dc1cccf0809332fffd3aac068cc5cd1b013795c7f4fd70fcd7994719d206402bef372b230d04423da4079117d13c1241a2c0de8fb4bce65d42')

package() {
   mkdir -p "${pkgdir}/usr/share/applications/"
   install -Dm644 "${srcdir}/Duke Nukem 3D/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/End User License Agreement.txt"
   install -Dm644 "${srcdir}/Duke Nukem 3D/support/gog-duke-nukem-3d.png" "${pkgdir}/usr/share/pixmaps/gog-duke-nukem-3d.png"
   install -Dm755 "${srcdir}/dukenukem3d.sh" "${pkgdir}/opt/Duke Nukem 3D/dukenukem3d.sh"
   install -Dm755 "${srcdir}/dukenukem3d-settings.sh" "${pkgdir}/opt/Duke Nukem 3D/dukenukem3d-settings.sh"
   install -Dm755 "${srcdir}/dukenukem3d-editor.sh" "${pkgdir}/opt/Duke Nukem 3D/dukenukem3d-editor.sh"

   sed "s/Exec=gog-duke-nukem-3d/Exec=\/opt\/Duke Nukem 3D\/dukenukem3d.sh/g" < "${srcdir}/Duke Nukem 3D/support/gog-duke-nukem-3d-primary.desktop" > "${pkgdir}/usr/share/applications/dukenukem3d.desktop"

   rm -r "${srcdir}/Duke Nukem 3D"/{start.sh,dosbox,support} "${srcdir}/Duke Nukem 3D/docs/dosbox-0.74.tar.gz" 
   cp -R "${srcdir}/Duke Nukem 3D" "${pkgdir}/opt"
   chmod 1775 "${pkgdir}/opt/Duke Nukem 3D/data"
   chmod 0664 "${pkgdir}/opt/Duke Nukem 3D/data/DUKE3D.CFG"
}
