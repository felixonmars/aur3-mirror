# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=foldit
pkgver=beta.20150330
pkgrel=2
pkgdesc="A game enabling you to contribute to important scientific research"
arch=(x86_64)
url=http://fold.it/
license=('custom: free to use')
install=$pkgname.install
depends=(freeglut glu)
optdepends=('xclip: to enable copy-paste')
source=(http://fold.it/portal/files/app/Foldit-linux_x64.tar.gz
        $pkgname.desktop
        $pkgname.png
        $pkgname.sh)
sha256sums=('8601187f9e844a886c0805928d233a852efb38b4f97e7edf86a3be5f8c0023e3'
            'd9d46b35300caf7607e307b192d9c43f29c7b2f45b03e662ea12485eed4d297b'
            'bb8c113625c5176aca1a3953009c429e98983587ecb608aa0642f28766c7f5ba'
            'be223ef8264fc1f5393eabf95b46119105776b3faabb0a0160c1cd4c3d69529a')
sha512sums=('aaba77a1178abc39df0bbb513477eae36a151d5c95c4736f601b5ebf8a17081db39f17cecc0a516406a70f75932ecd91a9e879711cce3eee337afc601039a73a'
            'f283df9ed4744baa1ffc1cc2022a6b77dbe4a466900e1eadaef58d3ed67e2488ec60d613d455231434c0e33d8172fc62cfa80f34f4728c3f003aa77abb571c22'
            'a04d4c2dca585b306a169432b66f6043e426d4df72a6dd0600f2429d2dc1cae846314f775cafcb496af709ec350d8ecb4a25e6f9c3b0751e6033679c49a1cdd7'
            'ded8ada84a9e77405b985f7e63fb1de3f80079650a9766e1c2ab20914bb49aa24bb9cdb1a89b9ffda95748c9d5c7125770914f5de7b48e353c3593e04171bf0e')

package() {    
    install -Dm755 foldit.sh "$pkgdir"/usr/bin/foldit
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

    cd Foldit/
    install -d "$pkgdir"/usr/share/games/foldit/

    ##Don't move the old verions.
    cp -r cmp-binary-$(cat version-binary.txt) "$pkgdir"/usr/share/games/foldit/
    cp -r cmp-database-$(cat version-database.txt) "$pkgdir"/usr/share/games/foldit/
    cp -r cmp-resources-$(cat version-resources.txt) "$pkgdir"/usr/share/games/foldit/

    #Move rest of the stuff
    cp -r Foldit *.txt "$pkgdir"/usr/share/games/foldit/

    chown -R root:games "$pkgdir"/usr/share/games/foldit/
    chmod -R g+w "$pkgdir"/usr/share/games/foldit/
}
