#!/usr/bin/python

import collections
import os
import struct
import sys

# according to http://forum.xentax.com/viewtopic.php?p=17729#p17729
class RcfFile:

	DWORD_SIZE = 4
	DWORD_FORMAT = "I"
	HEADER_SIZE = 32 + 7 * DWORD_SIZE
	INNER_FILE_HEADER_SIZE = 3 * DWORD_SIZE
	
	def __init__(self, filename):
		self.filename = filename
		self.file = open(filename, "rb")
		self.loadHeader()
		self.printHeader()
		self.loadInnerFilenames()
	
	
	def loadHeader(self):
		self.seek(0)
		self.signature = self.readChars(32)
		self.ignoreDwords(3)
		self.posStartOfFilenames = self.readDword()
		self.ignoreDwords(2)
		self.numberOfFiles = self.readDword()
	
	def printHeader(self):
		print("File:", self.filename)
		print("Signature:", self.signature)
		print("Number of files:", self.numberOfFiles)

	
	def seek(self, pos):
		self.file.seek(pos)

	def read(self, size):
		return self.file.read(size)

	def readChar(self):
		return bytes.decode(self.file.read(1))

	def readChars(self, count):
		return bytes.decode(self.file.read(count))

	def ignoreDwords(self, count):
		self.file.seek(count * self.DWORD_SIZE, 1)

	def readDword(self):
		return struct.unpack(self.DWORD_FORMAT, \
			self.file.read(self.DWORD_SIZE))[0]
	
	
	def readInnerFilename(self):
		self.ignoreDwords(4)
		length = self.readDword()
		return self.readChars(length - 1)
	
	def loadInnerFilenames(self):
		self.innerFilenames = [""] * self.numberOfFiles
		self.seek(self.posStartOfFilenames + 4)  # don't know why + 4
		for i in range(self.numberOfFiles):
			self.innerFilenames[i] = self.readInnerFilename()
	

	def extractInnerFile(self, file):
		if not file.isAccepted():
			return
		filename = file.getSaveName()
		print("Extracting " + filename + "... ", end = "")
		sys.stdout.flush()
		target = open(filename, "wb")
		content = file.readContent()
		target.write(content)
		target.close()
		print("OK")
	
	def extractAllInnerFiles(self, innerFileClass):
		for i in range(self.numberOfFiles):
			self.extractInnerFile(innerFileClass(self, i))


class InnerFile:
	
	Info = collections.namedtuple("InnerFileInfo", "offset, size")
	
	def __init__(self, rcfFile, nr):
		self.rcf = rcfFile
		self.nr = nr
		self.info = self.readInfo()
		self.filename = self.getFilename()
	
	def readInfo(self):
		rcf = self.rcf
		rcf.seek(rcf.HEADER_SIZE + self.nr * rcf.INNER_FILE_HEADER_SIZE)
		rcf.ignoreDwords(1)
		return self.Info(offset = rcf.readDword(), size = rcf.readDword())
	
	def getFilename(self): return self.rcf.innerFilenames[self.nr]
	
	def isAccepted(self): return True
	
	def getSaveName(self): return self.filename
	
	def readContent(self):
		self.rcf.seek(self.info.offset)
		return self.rcf.read(self.info.size)


class SongsDb:

	genres = dict([
		['p', "All '80s Pop Mix"],
		['c', "All Country Mix"],
		['h', "All Hip-hop Mix"],
		['l', "All Latin Mix"],
		["rg", "All Reggae Mix"],
		["rgt", "All Reggeton Mix"],
		['r', "All Rock Mix"],
		['o', "Scarface O.S.T."]
	])

	# according to http://forum.xentax.com/viewtopic.php?p=19802#p19802
	songs = dict([
		["cash_beans", ("Johnny Cash", "Beans For Breakfast", 'c')],
		["iggy", ("Iggy Pop", "The Passenger", 'p')],
		["calle_wisin", ("Wisin Y Yandel", "Calle Callejero", "rgt")],
		["rundmc_itslikethat", ("Run DMC", "It's Like That!", 'h')],
		["dazz_whip", ("The Dazz Band", "Let It Whip", 'p')],
		["beth_dance", ("Beth Anderson", "Dance Dance Dance", 'o')],
		["sly_assault", ("Sly & Robbie", "Assault On Station 5", "rg")],
		["toots_funky", ("Toots & The Maytals", "Funky Kingston", "rg")],
		["public_dont", ("Public Enemy", "Don't Believe The Hype", 'h')],
		["earth_groove", ("Earth Wind & Fire", "Let's Groove", 'p')],
		["joecuba_calle", ("Joe Cuba Sextet", "La Calle Esta Durisma", 'l')],
		["peter_razor", ("Peter Tosh & The Wailers", "Steppin' Razor", "rg")],
		["uhuru_dark", ("Black Uhuru", "Darkness", "rg")],
		["ikon_war", ("ICON", "War", 'h')],
		["derrick_tough", ("Derrick Morgan", "Tougher Than Tough", "rg")],
		["pcairo_elpipsi", ("Cortijo Y Kako", "El Pipisigallo", 'l')],
		["arthur_hot", ("Elizabeth Daily", "I'm Hot Tonight", 'o')],
		["robzombie_letitallbleed",
			("Rob Zombie", "Let It All Bleed Out", 'r')],
		["moroder_79", ("Giorgio Moroder", "Disco 79", 'o')],
		["judas_breaking", ("Judas Priest", "Breaking The Law", 'r')],
		["nils", ("Nils Lofgren", "A Child Could Tell", 'r')],
		["latinbros_calenas",
			("The Latin Brothers", "Las Calenas Son Como Las Flores", 'l')],
		["senen_sopa", ("Senen Suarez", "La Sopa En Botella", 'l')],
		["africa_dont", ("Afrika Bambaataa", "Don't Stop...Planet Rock", 'h')],
		["control_de", ("Control Machete", "De", 'l')],
		["killingzone_allmylife", ("Killing Zone", "All My Life", 'r')],
		["cash_eaasy", ("Johnny Cash", "I'm An Easy Rider", 'c')],
		["moroder_succ", ("Giorgio Moroder", "Success", 'o')],
		["rundmc_suckermcs", ("Run DMC", "Sucker MC's", 'h')],
		["merle_fightin", ("Hank Thompson", "Cocaine Blues", 'c')],
		["mongo_latinsoul", ("Mongo Santamaria", "We Got Latin Soul", 'l')],
		["oriente_tira", ("Los Guaracheros De Oriente", "El Tira Y Jala", 'l')],
		["desmond_itmek", ("Desmond Dekker & The Aces", "It Mek", "rg")],
		["celina_agulla", ("Celina Y Reutilio", "Agallu Sola", 'l')],
		["giorgio_vamos", ("Giorgio Moroder", "Vamos A Bailar", 'o')],
		["latin_narco", ("Latin Soul Syndicate", "Narco Traffico", 'l')],
		["valentin_caiman", ("Bobby Valentin", "El Caiman", 'l')],
		["manu_reggae", ("Manu Dibango", "Reggae Makossa", "rg")],
		["ministry_peligro", ("Ministry", "Senor Peligro", 'r')],
		["rickjames_giveit", ("Rick James", "Give It To Me Baby", 'p')],
		["rock_steady", ("The Rocksteady Crew", "Hey You!", 'h')],
		["petter_det", ("Petter", "Det Gar Bra Nu", 'h')],
		# ["germany", ("")],
		["suicidal_mommy", ("Suicidal Tendencies", "I Saw Your Mommy", 'r')],
		["2020", ("20 / 20", "Yellow Pills", 'p')],
		["gunclub", ("Gun Club", "Sex Beat", 'r')],
		["phase_talkwithforce", ("Phrase", "Talk With Force", 'h')],
		["myspace", ("Kazy", "Choke", 'r')],
		["planet_play", ("Planet Patrol", "Play At Your Own Risk", 'h')],
		["third_96", ("Third World", "96 In The Shade", "rg")],
		["d12_getmygun", ("D12", "Get My Gun", 'h')],
		["cameo_strange", ("Cameo", "She's Strange", 'p')],
		["peter_push", ("Peter Bellotte", "Push It To The Limit", 'o')],
		["buju_giveittoher", ("Buju Banton", "Give It To Her", "rg")],
		["toots_fever", ("Toots & The Maytals", "Fever", "rg")],
		["irakere_bacalo", ("Irakere", "Bacalao Con Pan", 'l')],
		["wiretrain", ("Wire Train", "I'll Do You", 'p')],
		["prince_crab", ("Prince Jazzbo", "Crab Walking", "rg")],
		["somanypeople", ("Neurosonic", "So Many People", 'r')],
		["arthur_shake", ("Elizabeth Daily", "Shake It Up", 'o')],
		["damn_descarga", ("Damn!", "Descarga Cuatro Manos", 'l')],
		["jonzun_packjam", ("Jonzun Crew", "Pack Jam", 'h')],
		["tosh_400", ("Peter Tosh & The Wailers", "400 Years", "rg")],
		["fatboys_hardcore", ("The Fat Boys", "Hardcore Reggae", 'h')],
		["llcj_bells", ("LL Cool J", "Rock The Bells", 'h')],
		["uhuru_happ", ("Black Uhuru", "Happiness", "rg")],
		["uhuru_dinner", ("Black Uhuru", "Guess Who's Coming To Dinner", "rg")],
		["mala_nina", ("Mala Rodriguez", "La Nina", 'l')],
		["zap_reggae", ("Zap Pow", "This is Reggae Music", "rg")],
		["spear_social", ("Burning Spear", "Social Living", "rg")],
		["arthur_shes", ("Amy Holland", "She's On Fire", 'o')],
		["quebilla_bangbang", ("Que B.I.L.L.A.H.", "Bang Bang Boogie", 'r')],
		["motorhead", ("Motorhead", "Killed By Death", 'r')],
		["xavier_cuban", ("Xavier Cugat", "Cuban Mambo", 'l')],
		["giorgio_shoot", ("Giorgio Moroder", "Shoot And Drive Away", 'o')],
		["fatboys_human", ("The Fat Boys", "Human Beat Box", 'h')],
		["shaggy_standup", ("Shaggy", "Stand Up", "rg")],
		["rohff", ("Rohff", "La Resurrection", 'h')],
		["cypress_dedoverde", ("Cypress Hill", "Dr. Dedoverde", 'h')],
		# ["grant_avenue", ("")],
		["merle_workin", ("Waylon Jennings", "Waymore's Blues", 'c')],
		["globe_play", ("G.L.O.B.E.", "Play That Beat Mr. DJ", 'h')],
		["cortijo_quele", ("Cortijo Y Kako", "Que Le Paso", 'l')],
		["raida", ("Roc Raida feat. Axel", "Montana's Revenge", 'h')],
		["freddie_bobby", ("Freddie McGregor", "Bobby Babylon", "rg")],
		["clash_police", ("Junior Murvin", "Police And Thieves", "rg")],
		["billyocean_caribean", ("Billy Ocean", "Caribbean Queen", 'p')],
		["nighttime", ("Britt Black", "Night Time", 'r')],
		["three_bodyrock", ("Treacherous Three", "Body Rock", 'h')],
		["planet_cheap", ("Planet Patrol", "Cheap Thrills", 'h')],
		["train_eth", ("The Ethiopians", "Train To Skaville", "rg")],
		["llcool_whatyouwant",
			("LL Cool J feat. Freeway", "What You Want", 'h')],
		["kurtis_breaks", ("Kurtis Blow", "The Breaks", 'h')],
		["irakere_baila", ("Irakere & Chucho Valdez", "Baila Mi Ritmo", 'l')],
		["rickjames_freak", ("Rick James", "Super Freak", 'p')],
		# ["italy", ("")],
		["peter_turn", ("Peter Bellotte", "Turn Out The Light", 'o')],
		["control_bien", ("Control Machete", "Bien, Bien", 'r')],
		["murvin_police", ("Junior Murvin", "Police And Thieves", None)],
		["grand_mess", ("Grandmaster Flash", "The Message", 'h')],
		["shannon", ("Shannon", "Let The Music Play", 'p')],
		["funlovin_crime",
			("Fun Lovin' Criminals", "Crime And Punishment", 'r')],
		["africa_looking",
			("Afrika Bambaataa", "Looking For The Perfect Beat", 'h')],
		["deb_rush", ("Debbie Harry", "Rush Rush", 'o')],
		["duece_rideoff", ("Deuce Eclipse", "Ride Off In The Sunset", 'h')],
		["breal_worldisyours",
			("B-Real feat. Mellow Man Ace", "The World Is Yours", 'h')],
		["los_elmundo", ("Los Barachos", "El Mundo Es Mio", "rgt")],
		["giorgio_combination", ("Giorgio Moroder", "Right Combination", 'o')],
		["bif_alliwant", ("Bif Naked", "All I Want", 'r')],
		["particle", ("Particle", "The American Dream", 'r')],
		["willie_fried", ("Willie Bobo", "Fried Neckbones", 'l')],
		["grand_beat", ("Grandmaster Flash", "Beat Street", 'h')]
	])
	
	def getTriple(nickname):
		if nickname in SongsDb.songs:
			(author, song, genre) = SongsDb.songs[nickname]
			if genre == None: return (author, song, None)
			return (author, song, SongsDb.genres[genre])
		return None


class MusicFile(InnerFile):
	
	def getFilename(self):
		self.rcf.seek(self.info.offset + 24)
		filename = ""
		while True:
			try: char = self.rcf.readChar()
			except: break
			if char == chr(0): break
			filename += char
		return filename
	
	def isAccepted(self):
		if self.filename.endswith(".wav") and \
			self.filename.find("tapeplayer") != -1:
			return True
		return False
	
	def getSaveName(self):
		nickname = self.filename.split("\\")[-1].replace(".wav", ""). \
			replace("tp_", "")
		triple = SongsDb.getTriple(nickname)
		if triple == None: return nickname + ".ogg"
		(author, song, genre) = triple
		author = author.replace(" / ", "-")  # because of 20 / 20
		if genre == None: genre = ""
		return os.path.join(genre, author + " - " + song + ".ogg")

	def readContent(self):
		return super().readContent()[2048:]


def main():
	print("Scarface: The World Is Yours' music files extractor")
	rcfFiles = sorted(filter(lambda filename: filename.endswith(".rcf"), \
		os.listdir(".")))
	if len(rcfFiles) < 1:
		print("Please run in the game's directory (or symlink sound*.rcf here)")
		sys.exit()
	try:
		for dir in SongsDb.genres.values():
			if not os.path.isdir(dir):
				os.makedirs(dir)
		for filename in rcfFiles:
			RcfFile(filename).extractAllInnerFiles(MusicFile)
	except PermissionError:
		print("Error: cannot write here!")

if __name__ == "__main__":
	main()
