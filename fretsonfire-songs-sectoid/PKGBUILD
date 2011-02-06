# Contributor: Black Mage <vleon1@gmail.com>

pkgname=fretsonfire-songs-sectoid
pkgver=1
pkgrel=1
pkgdesc="Sectoid songs for Frets on Fire"
url="http://www.nivel21.net/personal/sectoid/web/index.php"
arch=('any')
license=('CCPL')
groups=('games')
makedepend=('unrar' 'unzip')
depends=('fretsonfire')
source=("http://www.nivel21.net/personal/sectoid/fretsonfire/Sectoid_Frets_on_Fire_Song_Pack.zip"
        "http://www.nivel21.net/personal/sectoid/musica/Blood_Beast.rar"
        "http://www.nivel21.net/personal/sectoid/fretsonfire/Life's_Journey.zip"
        "http://www.nivel21.net/personal/sectoid/musica/moonlight.rar"
        "http://www.nivel21.net/personal/sectoid/fretsonfire/seven_nights.zip"
        "http://www.nivel21.net/personal/sectoid/musica/The_Game.rar"
        "http://www.nivel21.net/personal/sectoid/fretsonfire/The_Other_Side.rar"
        "http://www.nivel21.net/personal/sectoid/musica/Xtreme_Table_Soccer.rar")

md5sums=('0147fe7e078f927df03b4db6bd2e97bf'
         '136515e4a79b7c70afbad553c036d5b2'
         '01b08a1f9a39de603c6d41d288d570cd'
         '1cf0e540dc57e4a318a3b3fe27f0b1ac'
         '54b5eaf7ae321469393619ad8242fe75'
         '5cebca57aa14cd5cdaa7a6787ad4899a'
         '87421d59bb1b46c8f9151c59d210e15f'
         '6cf92af1cb65cfad173fa95be1ba6fcf')

build() {

  #Unrar the rar files
  unrar x $srcdir/"Blood_Beast.rar"
  unrar x $srcdir/"moonlight.rar"
  unrar x $srcdir/"The_Game.rar"
  unrar x $srcdir/"The_Other_Side.rar"
  unrar x $srcdir/"Xtreme_Table_Soccer.rar"

  #Create the directory for the songs
  install -d -m 755 $pkgdir/usr/share/fretsonfire/data/songs

  #Move the songs to their directory
  mv $srcdir/"Escape from chaosland" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"Feelings" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"Life's Journey" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"Metal madness" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"Ryu's theme" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"Seven Nights" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"War of freedom" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"Blood Beast" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"Moonlight" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"The Game" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"The Other Side" $pkgdir/usr/share/fretsonfire/data/songs
  mv $srcdir/"Xtreme Table Soccer" $pkgdir/usr/share/fretsonfire/data/songs

  #Fix permission issues
  chmod -R 755 $pkgdir/usr/share/fretsonfire/data/songs
  find $pkgdir/usr/share/fretsonfire/data/songs -type f -exec chmod 664 {} +

}
